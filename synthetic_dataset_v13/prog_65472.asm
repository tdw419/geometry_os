; DESCRIPTION: Composite: Renders a blue line between points (322, 13) and (97, 189) then Creates a white rectangular region at (397, 32) spanning 42 by 40 pixels then Renders a red disk with center (436, 83) and radius 15.
; PLAN: r0=322(x1), r1=13(y1), r2=97(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=32(y), r7=42(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=83(y), r12=15(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 322
LDI r1, 13
LDI r2, 97
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 32
LDI r7, 42
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 83
LDI r12, 15
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
