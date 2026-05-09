; DESCRIPTION: Composite: Draws a green circle centered at (143, 37) with radius 25 then Places a yellow line segment connecting (385, 17) to (358, 164) then Places a green dot at position (240, 177).
; PLAN: r0=143(x), r1=37(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=17(y1), r7=358(x2), r8=164(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=177(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 37
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 17
LDI r7, 358
LDI r8, 164
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 177
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
