; DESCRIPTION: Composite: Renders a yellow line between points (375, 30) and (486, 208) then Creates a cyan circular shape at (87, 56) with radius 26 then Places a white 11x14 rectangle at position (489, 13).
; PLAN: r0=375(x1), r1=30(y1), r2=486(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=56(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x), r11=13(y), r12=11(width), r13=14(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 30
LDI r2, 486
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 56
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 13
LDI r12, 11
LDI r13, 14
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
