; DESCRIPTION: Composite: Draws a yellow line from (204, 130) to (139, 146) then Sets a single red pixel at (105, 215) then Renders a cyan disk with center (251, 167) and radius 70.
; PLAN: r0=204(x1), r1=130(y1), r2=139(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=215(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=167(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 130
LDI r2, 139
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 215
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 251
LDI r11, 167
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
