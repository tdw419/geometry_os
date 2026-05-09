; DESCRIPTION: Composite: Places a white circle of radius 42 at center (385, 199) then Places a yellow 60x97 rectangle at position (211, 94) then Renders a orange line between points (267, 170) and (174, 36).
; PLAN: r0=385(x), r1=199(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=94(y), r7=60(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x1), r11=170(y1), r12=174(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 199
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 94
LDI r7, 60
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 170
LDI r12, 174
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
