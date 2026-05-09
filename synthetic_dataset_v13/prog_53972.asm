; DESCRIPTION: Renders a blue box of size 77x79 starting at (301, 26).
; PLAN: r0=301(x), r1=26(y), r2=77(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 26
LDI r2, 77
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
