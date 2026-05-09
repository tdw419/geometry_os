; DESCRIPTION: Renders a purple disk with center (415, 186) and radius 43.
; PLAN: r0=415(x), r1=186(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 186
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
