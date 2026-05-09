; DESCRIPTION: Composite: Sets a single purple pixel at (303, 75) then Places a purple line segment connecting (135, 184) to (210, 252) then Draws a purple circle centered at (333, 72) with radius 39.
; PLAN: r0=303(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=135(x1), r6=184(y1), r7=210(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=72(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 184
LDI r7, 210
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 72
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
