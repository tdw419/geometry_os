; DESCRIPTION: Composite: Places a red line segment connecting (402, 129) to (399, 52) then Creates a cyan rectangular region at (81, 20) spanning 100 by 95 pixels then Draws a cyan circle centered at (74, 193) with radius 23.
; PLAN: r0=402(x1), r1=129(y1), r2=399(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=20(y), r7=100(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x), r11=193(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 129
LDI r2, 399
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 20
LDI r7, 100
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 193
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
