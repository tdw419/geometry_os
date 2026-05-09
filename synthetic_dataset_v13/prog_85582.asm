; DESCRIPTION: Composite: Sets a single white pixel at (408, 140) then Places a cyan line segment connecting (482, 22) to (153, 54) then Draws a green circle centered at (478, 186) with radius 31.
; PLAN: r0=408(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=22(y1), r7=153(x2), r8=54(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=478(x), r11=186(y), r12=31(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 140
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 482
LDI r6, 22
LDI r7, 153
LDI r8, 54
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 186
LDI r12, 31
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
