; DESCRIPTION: Composite: Places a white line segment connecting (44, 244) to (187, 46) then Places a black circle of radius 51 at center (56, 176) then Creates a green rectangular region at (434, 197) spanning 34 by 46 pixels.
; PLAN: r0=44(x1), r1=244(y1), r2=187(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=176(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x), r11=197(y), r12=34(width), r13=46(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 244
LDI r2, 187
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 176
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 197
LDI r12, 34
LDI r13, 46
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
