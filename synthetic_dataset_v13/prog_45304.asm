; DESCRIPTION: Composite: Renders a orange box of size 119x83 starting at (392, 37) then Places a black line segment connecting (317, 187) to (340, 62) then Creates a magenta circular shape at (320, 145) with radius 65.
; PLAN: r0=392(x), r1=37(y), r2=119(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=187(y1), r7=340(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=145(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 37
LDI r2, 119
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 187
LDI r7, 340
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 145
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
