; DESCRIPTION: Composite: Renders a blue line between points (478, 73) and (358, 87) then Places a white circle of radius 52 at center (237, 103).
; PLAN: r0=478(x1), r1=73(y1), r2=358(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=103(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 73
LDI r2, 358
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 103
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
