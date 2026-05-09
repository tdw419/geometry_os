; DESCRIPTION: Composite: Draws a orange line from (22, 164) to (269, 6) then Places a green dot at position (198, 180) then Draws a green circle centered at (165, 105) with radius 67.
; PLAN: r0=22(x1), r1=164(y1), r2=269(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=105(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 164
LDI r2, 269
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 165
LDI r11, 105
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
