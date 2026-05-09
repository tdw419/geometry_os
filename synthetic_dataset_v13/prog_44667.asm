; DESCRIPTION: Composite: Sets a single cyan pixel at (81, 22) then Renders a magenta line between points (66, 47) and (316, 52) then Draws a yellow circle centered at (338, 144) with radius 48.
; PLAN: r0=81(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=47(y1), r7=316(x2), r8=52(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=144(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 47
LDI r7, 316
LDI r8, 52
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 144
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
