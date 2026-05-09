; DESCRIPTION: Composite: Renders a yellow line between points (383, 220) and (137, 213) then Renders a red box of size 104x83 starting at (98, 54) then Creates a blue circular shape at (164, 172) with radius 68.
; PLAN: r0=383(x1), r1=220(y1), r2=137(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=54(y), r7=104(width), r8=83(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x), r11=172(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 220
LDI r2, 137
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 54
LDI r7, 104
LDI r8, 83
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 172
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
