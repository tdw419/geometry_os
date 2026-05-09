; DESCRIPTION: Composite: Places a purple dot at position (490, 220) then Places a magenta line segment connecting (120, 137) to (432, 107) then Draws a purple circle centered at (385, 67) with radius 36.
; PLAN: r0=490(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=120(x1), r6=137(y1), r7=432(x2), r8=107(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=67(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 137
LDI r7, 432
LDI r8, 107
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 67
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
