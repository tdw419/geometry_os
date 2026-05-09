; DESCRIPTION: Composite: Renders a orange box of size 116x40 starting at (152, 112) then Places a orange line segment connecting (361, 112) to (207, 80) then Places a green circle of radius 26 at center (196, 187).
; PLAN: r0=152(x), r1=112(y), r2=116(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x1), r6=112(y1), r7=207(x2), r8=80(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=187(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 112
LDI r2, 116
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 112
LDI r7, 207
LDI r8, 80
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 187
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
