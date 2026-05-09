; DESCRIPTION: Renders a purple disk with center (406, 162) and radius 36.
; PLAN: r0=406(x), r1=162(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 162
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
