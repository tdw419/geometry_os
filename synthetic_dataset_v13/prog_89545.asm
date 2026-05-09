; DESCRIPTION: Composite: Places a white line segment connecting (55, 231) to (253, 3) then Creates a cyan rectangular region at (284, 191) spanning 20 by 55 pixels then Places a blue circle of radius 44 at center (106, 157).
; PLAN: r0=55(x1), r1=231(y1), r2=253(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=191(y), r7=20(width), r8=55(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x), r11=157(y), r12=44(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 231
LDI r2, 253
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 191
LDI r7, 20
LDI r8, 55
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 157
LDI r12, 44
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
