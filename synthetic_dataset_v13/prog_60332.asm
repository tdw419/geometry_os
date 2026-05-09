; DESCRIPTION: Renders a blue box of size 110x23 starting at (185, 44).
; PLAN: r0=185(x), r1=44(y), r2=110(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 44
LDI r2, 110
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
