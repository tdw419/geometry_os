; DESCRIPTION: Composite: Renders a red disk with center (184, 179) and radius 52 then Draws a cyan line from (197, 35) to (49, 144) then Sets a single purple pixel at (358, 116).
; PLAN: r0=184(x), r1=179(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=35(y1), r7=49(x2), r8=144(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=116(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 179
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 35
LDI r7, 49
LDI r8, 144
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 116
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
