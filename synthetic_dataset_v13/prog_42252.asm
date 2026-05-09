; DESCRIPTION: Renders a purple disk with center (370, 107) and radius 32.
; PLAN: r0=370(x), r1=107(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 107
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
