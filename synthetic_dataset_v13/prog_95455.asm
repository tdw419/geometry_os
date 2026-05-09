; DESCRIPTION: Places a green circle of radius 55 at center (251, 107).
; PLAN: r0=251(x), r1=107(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 107
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
