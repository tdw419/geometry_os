; DESCRIPTION: Places a green circle of radius 35 at center (205, 196).
; PLAN: r0=205(x), r1=196(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 196
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
