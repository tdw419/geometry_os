; DESCRIPTION: Composite: Places a green line segment connecting (34, 110) to (251, 233) then Draws a cyan circle centered at (158, 73) with radius 63 then Places a orange 80x92 rectangle at position (188, 121).
; PLAN: r0=34(x1), r1=110(y1), r2=251(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=73(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=188(x), r11=121(y), r12=80(width), r13=92(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 110
LDI r2, 251
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 73
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 188
LDI r11, 121
LDI r12, 80
LDI r13, 92
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
