; DESCRIPTION: Composite: Places a orange dot at position (336, 135) then Places a purple line segment connecting (230, 57) to (323, 206) then Places a white circle of radius 33 at center (479, 123).
; PLAN: r0=336(x), r1=135(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=57(y1), r7=323(x2), r8=206(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=479(x), r11=123(y), r12=33(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 336
LDI r1, 135
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 230
LDI r6, 57
LDI r7, 323
LDI r8, 206
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 123
LDI r12, 33
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
