; DESCRIPTION: Composite: Renders a purple box of size 85x48 starting at (139, 125) then Places a black dot at position (351, 204) then Places a orange line segment connecting (400, 73) to (221, 248).
; PLAN: r0=139(x), r1=125(y), r2=85(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=204(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=73(y1), r12=221(x2), r13=248(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 125
LDI r2, 85
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 204
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 400
LDI r11, 73
LDI r12, 221
LDI r13, 248
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
