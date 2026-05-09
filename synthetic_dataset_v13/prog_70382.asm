; DESCRIPTION: Composite: Renders a orange box of size 106x87 starting at (264, 91) then Places a green line segment connecting (422, 204) to (73, 241) then Renders a purple disk with center (140, 110) and radius 33.
; PLAN: r0=264(x), r1=91(y), r2=106(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=204(y1), r7=73(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=110(y), r12=33(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 91
LDI r2, 106
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 204
LDI r7, 73
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 110
LDI r12, 33
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
