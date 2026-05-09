; DESCRIPTION: Composite: Renders a white box of size 89x83 starting at (105, 170) then Creates a cyan circular shape at (381, 76) with radius 56 then Places a cyan line segment connecting (446, 18) to (393, 160).
; PLAN: r0=105(x), r1=170(y), r2=89(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=76(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x1), r11=18(y1), r12=393(x2), r13=160(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 170
LDI r2, 89
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 76
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 18
LDI r12, 393
LDI r13, 160
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
