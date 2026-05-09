; DESCRIPTION: Composite: Places a yellow line segment connecting (315, 26) to (309, 233) then Creates a red circular shape at (38, 65) with radius 13 then Renders a white box of size 47x113 starting at (26, 81).
; PLAN: r0=315(x1), r1=26(y1), r2=309(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=65(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=81(y), r12=47(width), r13=113(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 26
LDI r2, 309
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 65
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 81
LDI r12, 47
LDI r13, 113
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
