; DESCRIPTION: Renders a purple disk with center (98, 205) and radius 39.
; PLAN: r0=98(x), r1=205(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 205
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
