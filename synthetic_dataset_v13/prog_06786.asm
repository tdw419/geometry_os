; DESCRIPTION: Places a red 91x80 rectangle at position (80, 87).
; PLAN: r0=80(x), r1=87(y), r2=91(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 87
LDI r2, 91
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
