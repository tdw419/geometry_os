; DESCRIPTION: Composite: Places a black 22x15 rectangle at position (183, 241) then Creates a white circular shape at (143, 170) with radius 54 then Renders a green line between points (419, 22) and (196, 84).
; PLAN: r0=183(x), r1=241(y), r2=22(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=170(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x1), r11=22(y1), r12=196(x2), r13=84(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 241
LDI r2, 22
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 170
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 22
LDI r12, 196
LDI r13, 84
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
