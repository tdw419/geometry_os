; DESCRIPTION: Composite: Places a purple dot at position (122, 249) then Places a blue line segment connecting (63, 121) to (422, 73) then Draws a green circle centered at (286, 207) with radius 13.
; PLAN: r0=122(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=121(y1), r7=422(x2), r8=73(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=207(y), r12=13(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 249
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 121
LDI r7, 422
LDI r8, 73
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 207
LDI r12, 13
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
