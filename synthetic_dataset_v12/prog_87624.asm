; DESCRIPTION: Composite: Places a orange circle of radius 55 at center (436, 56) then Renders a red box of size 86x81 starting at (94, 2) then Renders a black line between points (130, 91) and (386, 199).
; PLAN: r0=436(x), r1=56(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=2(y), r7=86(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x1), r11=91(y1), r12=386(x2), r13=199(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 56
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 2
LDI r7, 86
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 91
LDI r12, 386
LDI r13, 199
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
