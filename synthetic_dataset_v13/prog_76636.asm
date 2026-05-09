; DESCRIPTION: Composite: Draws a orange circle centered at (316, 68) with radius 67 then Places a black line segment connecting (129, 178) to (372, 220) then Places a black dot at position (479, 68).
; PLAN: r0=316(x), r1=68(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x1), r6=178(y1), r7=372(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=68(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 68
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 178
LDI r7, 372
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 68
LDI r12, 0x000000
PSET r10, r11, r12
HALT
