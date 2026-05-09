; DESCRIPTION: Composite: Creates a purple rectangular region at (149, 111) spanning 33 by 13 pixels then Places a magenta line segment connecting (291, 137) to (427, 171) then Renders a white disk with center (210, 101) and radius 71.
; PLAN: r0=149(x), r1=111(y), r2=33(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=137(y1), r7=427(x2), r8=171(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=101(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 111
LDI r2, 33
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 137
LDI r7, 427
LDI r8, 171
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 101
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
