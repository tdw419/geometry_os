; DESCRIPTION: Composite: Places a cyan line segment connecting (171, 252) to (86, 145) then Renders a purple box of size 33x26 starting at (352, 18) then Creates a white circular shape at (304, 146) with radius 40.
; PLAN: r0=171(x1), r1=252(y1), r2=86(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=18(y), r7=33(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=146(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 252
LDI r2, 86
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 18
LDI r7, 33
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 146
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
