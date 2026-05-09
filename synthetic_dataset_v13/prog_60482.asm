; DESCRIPTION: Composite: Draws a magenta circle centered at (164, 117) with radius 74 then Sets a single black pixel at (318, 244) then Renders a magenta line between points (470, 174) and (215, 220).
; PLAN: r0=164(x), r1=117(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=244(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=470(x1), r11=174(y1), r12=215(x2), r13=220(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 117
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 244
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 470
LDI r11, 174
LDI r12, 215
LDI r13, 220
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
