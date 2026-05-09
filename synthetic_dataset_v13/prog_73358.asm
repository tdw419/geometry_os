; DESCRIPTION: Composite: Renders a red line between points (27, 6) and (492, 44) then Places a yellow 31x83 rectangle at position (47, 34) then Creates a yellow circular shape at (137, 84) with radius 13.
; PLAN: r0=27(x1), r1=6(y1), r2=492(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=34(y), r7=31(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=84(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 6
LDI r2, 492
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 34
LDI r7, 31
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 84
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
