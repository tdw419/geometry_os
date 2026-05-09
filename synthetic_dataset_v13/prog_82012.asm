; DESCRIPTION: Composite: Renders a blue line between points (439, 253) and (278, 124) then Places a purple circle of radius 66 at center (185, 93).
; PLAN: r0=439(x1), r1=253(y1), r2=278(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=93(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 253
LDI r2, 278
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 93
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
