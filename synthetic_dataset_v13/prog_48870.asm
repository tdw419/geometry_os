; DESCRIPTION: Composite: Renders a purple disk with center (341, 215) and radius 37 then Renders a black line between points (329, 120) and (358, 192) then Sets a single cyan pixel at (465, 153).
; PLAN: r0=341(x), r1=215(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=120(y1), r7=358(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=153(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 215
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 120
LDI r7, 358
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 153
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
