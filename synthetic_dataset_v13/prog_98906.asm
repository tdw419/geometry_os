; DESCRIPTION: Composite: Sets a single white pixel at (75, 17) then Draws a purple rectangle at (406, 211) with width 15 and height 15 then Places a black line segment connecting (458, 144) to (69, 179).
; PLAN: r0=75(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=211(y), r7=15(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x1), r11=144(y1), r12=69(x2), r13=179(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 211
LDI r7, 15
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 144
LDI r12, 69
LDI r13, 179
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
