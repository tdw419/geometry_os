; DESCRIPTION: Places a green circle of radius 35 at center (181, 107).
; PLAN: r0=181(x), r1=107(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 107
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
