; DESCRIPTION: Composite: Sets a single purple pixel at (380, 222) then Places a orange line segment connecting (75, 2) to (119, 7) then Renders a purple box of size 115x69 starting at (172, 8).
; PLAN: r0=380(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=2(y1), r7=119(x2), r8=7(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=8(y), r12=115(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 2
LDI r7, 119
LDI r8, 7
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 8
LDI r12, 115
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
