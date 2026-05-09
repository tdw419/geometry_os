; DESCRIPTION: Renders a green box of size 56x117 starting at (84, 77).
; PLAN: r0=84(x), r1=77(y), r2=56(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 77
LDI r2, 56
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
