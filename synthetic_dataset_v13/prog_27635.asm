; DESCRIPTION: Composite: Renders a black line between points (302, 40) and (479, 83) then Renders a white disk with center (171, 122) and radius 70 then Creates a magenta rectangular region at (436, 1) spanning 54 by 105 pixels.
; PLAN: r0=302(x1), r1=40(y1), r2=479(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=122(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=1(y), r12=54(width), r13=105(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 40
LDI r2, 479
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 122
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 1
LDI r12, 54
LDI r13, 105
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
