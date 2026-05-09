; DESCRIPTION: Composite: Draws a orange rectangle at (42, 119) with width 22 and height 19 then Places a orange circle of radius 27 at center (484, 172) then Renders a orange line between points (318, 129) and (211, 139).
; PLAN: r0=42(x), r1=119(y), r2=22(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=172(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x1), r11=129(y1), r12=211(x2), r13=139(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 119
LDI r2, 22
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 172
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 129
LDI r12, 211
LDI r13, 139
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
