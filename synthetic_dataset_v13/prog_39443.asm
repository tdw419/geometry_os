; DESCRIPTION: Places a blue circle of radius 20 at center (106, 172).
; PLAN: r0=106(x), r1=172(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 172
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
