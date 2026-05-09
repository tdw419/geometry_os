; DESCRIPTION: Composite: Sets a single cyan pixel at (90, 198) then Places a black line segment connecting (115, 238) to (446, 200) then Creates a green rectangular region at (411, 158) spanning 61 by 25 pixels.
; PLAN: r0=90(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=238(y1), r7=446(x2), r8=200(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=158(y), r12=61(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 238
LDI r7, 446
LDI r8, 200
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 158
LDI r12, 61
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
