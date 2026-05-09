; DESCRIPTION: Composite: Places a green dot at position (132, 181) then Places a white line segment connecting (482, 110) to (158, 170) then Places a yellow 52x74 rectangle at position (326, 20).
; PLAN: r0=132(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=110(y1), r7=158(x2), r8=170(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=20(y), r12=52(width), r13=74(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 482
LDI r6, 110
LDI r7, 158
LDI r8, 170
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 20
LDI r12, 52
LDI r13, 74
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
