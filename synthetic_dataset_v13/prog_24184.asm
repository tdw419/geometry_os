; DESCRIPTION: Composite: Creates a orange circular shape at (282, 151) with radius 60 then Draws a cyan line from (162, 192) to (468, 73) then Renders a yellow box of size 68x89 starting at (172, 4).
; PLAN: r0=282(x), r1=151(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x1), r6=192(y1), r7=468(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=4(y), r12=68(width), r13=89(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 151
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 192
LDI r7, 468
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 4
LDI r12, 68
LDI r13, 89
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
