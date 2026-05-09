; DESCRIPTION: Composite: Creates a cyan circular shape at (417, 106) with radius 47 then Places a blue dot at position (351, 215) then Renders a blue line between points (334, 73) and (315, 177).
; PLAN: r0=417(x), r1=106(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=215(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=334(x1), r11=73(y1), r12=315(x2), r13=177(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 106
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 215
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 73
LDI r12, 315
LDI r13, 177
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
