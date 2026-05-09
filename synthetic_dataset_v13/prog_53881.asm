; DESCRIPTION: Renders a purple disk with center (374, 187) and radius 49.
; PLAN: r0=374(x), r1=187(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 187
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
