; DESCRIPTION: Composite: Creates a purple circular shape at (198, 102) with radius 65 then Places a purple 65x109 rectangle at position (107, 37) then Renders a purple line between points (126, 154) and (76, 45).
; PLAN: r0=198(x), r1=102(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=37(y), r7=65(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x1), r11=154(y1), r12=76(x2), r13=45(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 102
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 37
LDI r7, 65
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 154
LDI r12, 76
LDI r13, 45
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
