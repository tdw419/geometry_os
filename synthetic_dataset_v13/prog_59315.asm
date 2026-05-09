; DESCRIPTION: Composite: Renders a cyan line between points (95, 120) and (188, 228) then Creates a white circular shape at (472, 211) with radius 19 then Sets a single blue pixel at (24, 216).
; PLAN: r0=95(x1), r1=120(y1), r2=188(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=211(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=216(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 120
LDI r2, 188
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 211
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 216
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
