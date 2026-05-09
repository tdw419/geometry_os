; DESCRIPTION: Composite: Places a purple line segment connecting (20, 30) to (492, 123) then Draws a cyan rectangle at (271, 1) with width 63 and height 93 then Creates a red circular shape at (337, 95) with radius 72.
; PLAN: r0=20(x1), r1=30(y1), r2=492(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=1(y), r7=63(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=95(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 30
LDI r2, 492
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 1
LDI r7, 63
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 95
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
