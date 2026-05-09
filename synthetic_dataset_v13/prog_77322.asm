; DESCRIPTION: Renders a purple disk with center (392, 193) and radius 52.
; PLAN: r0=392(x), r1=193(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 193
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
