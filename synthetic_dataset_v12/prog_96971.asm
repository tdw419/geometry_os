; DESCRIPTION: Composite: Draws a yellow line from (246, 141) to (9, 8) then Places a green dot at position (213, 112) then Renders a orange disk with center (337, 127) and radius 50.
; PLAN: r0=246(x1), r1=141(y1), r2=9(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=127(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 141
LDI r2, 9
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 337
LDI r11, 127
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
