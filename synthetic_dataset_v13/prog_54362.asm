; DESCRIPTION: Composite: Renders a green box of size 44x43 starting at (173, 18) then Draws a cyan line from (463, 101) to (230, 3) then Creates a black circular shape at (265, 68) with radius 39.
; PLAN: r0=173(x), r1=18(y), r2=44(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=101(y1), r7=230(x2), r8=3(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=68(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 18
LDI r2, 44
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 101
LDI r7, 230
LDI r8, 3
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 68
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
