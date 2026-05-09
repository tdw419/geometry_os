; DESCRIPTION: Composite: Renders a cyan line between points (183, 40) and (121, 153) then Renders a orange box of size 69x22 starting at (20, 21) then Creates a cyan circular shape at (393, 157) with radius 63.
; PLAN: r0=183(x1), r1=40(y1), r2=121(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=21(y), r7=69(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x), r11=157(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 40
LDI r2, 121
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 21
LDI r7, 69
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 157
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
