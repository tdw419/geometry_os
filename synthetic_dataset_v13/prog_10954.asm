; DESCRIPTION: Composite: Renders a blue line between points (51, 144) and (318, 183) then Draws a magenta circle centered at (171, 195) with radius 57 then Sets a single green pixel at (439, 172).
; PLAN: r0=51(x1), r1=144(y1), r2=318(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=195(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=172(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 144
LDI r2, 318
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 195
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 172
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
