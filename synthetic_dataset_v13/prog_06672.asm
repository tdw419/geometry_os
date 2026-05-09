; DESCRIPTION: Composite: Draws a orange line from (306, 168) to (436, 66) then Places a magenta dot at position (198, 186) then Renders a blue disk with center (183, 214) and radius 13.
; PLAN: r0=306(x1), r1=168(y1), r2=436(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=186(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=214(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 168
LDI r2, 436
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 186
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 183
LDI r11, 214
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
