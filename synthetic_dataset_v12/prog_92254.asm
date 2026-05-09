; DESCRIPTION: Renders a purple disk with center (113, 186) and radius 70.
; PLAN: r0=113(x), r1=186(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 186
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
