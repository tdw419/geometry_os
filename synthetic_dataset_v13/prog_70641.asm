; DESCRIPTION: Places a yellow 73x102 rectangle at position (369, 28).
; PLAN: r0=369(x), r1=28(y), r2=73(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 28
LDI r2, 73
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
