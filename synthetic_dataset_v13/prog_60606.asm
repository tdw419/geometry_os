; DESCRIPTION: Composite: Creates a blue circular shape at (349, 98) with radius 14 then Places a yellow dot at position (112, 165) then Draws a orange line from (29, 97) to (75, 130).
; PLAN: r0=349(x), r1=98(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=165(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=29(x1), r11=97(y1), r12=75(x2), r13=130(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 98
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 165
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 29
LDI r11, 97
LDI r12, 75
LDI r13, 130
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
