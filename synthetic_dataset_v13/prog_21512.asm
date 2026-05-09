; DESCRIPTION: Composite: Draws a black circle centered at (282, 84) with radius 74 then Renders a magenta line between points (166, 232) and (502, 45) then Sets a single cyan pixel at (306, 20).
; PLAN: r0=282(x), r1=84(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=232(y1), r7=502(x2), r8=45(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=20(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 84
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 232
LDI r7, 502
LDI r8, 45
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 20
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
