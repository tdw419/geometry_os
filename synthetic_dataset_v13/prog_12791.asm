; DESCRIPTION: Renders a purple disk with center (229, 149) and radius 70.
; PLAN: r0=229(x), r1=149(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 149
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
