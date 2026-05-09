; DESCRIPTION: Places a green circle of radius 52 at center (135, 172).
; PLAN: r0=135(x), r1=172(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 172
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
