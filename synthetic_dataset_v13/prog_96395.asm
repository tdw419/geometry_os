; DESCRIPTION: Composite: Places a magenta line segment connecting (353, 95) to (393, 28) then Places a purple dot at position (76, 108) then Draws a black circle centered at (42, 84) with radius 40.
; PLAN: r0=353(x1), r1=95(y1), r2=393(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=108(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=42(x), r11=84(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 95
LDI r2, 393
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 108
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 42
LDI r11, 84
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
