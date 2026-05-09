; DESCRIPTION: Places a red 73x80 rectangle at position (369, 28).
; PLAN: r0=369(x), r1=28(y), r2=73(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 28
LDI r2, 73
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
