; DESCRIPTION: Composite: Renders a green disk with center (356, 101) and radius 70 then Creates a cyan rectangular region at (254, 55) spanning 43 by 107 pixels then Places a black line segment connecting (391, 44) to (32, 126).
; PLAN: r0=356(x), r1=101(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=55(y), r7=43(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x1), r11=44(y1), r12=32(x2), r13=126(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 101
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 55
LDI r7, 43
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 44
LDI r12, 32
LDI r13, 126
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
