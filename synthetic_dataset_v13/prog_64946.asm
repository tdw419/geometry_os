; DESCRIPTION: Composite: Places a black line segment connecting (103, 249) to (109, 252) then Renders a white box of size 107x110 starting at (287, 80) then Renders a white disk with center (255, 74) and radius 48.
; PLAN: r0=103(x1), r1=249(y1), r2=109(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=80(y), r7=107(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=74(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 249
LDI r2, 109
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 80
LDI r7, 107
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 74
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
