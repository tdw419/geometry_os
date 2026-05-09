; DESCRIPTION: Composite: Renders a purple line between points (252, 12) and (127, 102) then Places a green dot at position (186, 219) then Draws a green circle centered at (292, 146) with radius 32.
; PLAN: r0=252(x1), r1=12(y1), r2=127(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=219(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=146(y), r12=32(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 12
LDI r2, 127
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 219
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 292
LDI r11, 146
LDI r12, 32
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
