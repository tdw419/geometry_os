; DESCRIPTION: Composite: Draws a black circle centered at (231, 82) with radius 76 then Places a purple line segment connecting (265, 201) to (217, 13) then Renders a white box of size 31x42 starting at (262, 96).
; PLAN: r0=231(x), r1=82(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x1), r6=201(y1), r7=217(x2), r8=13(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=96(y), r12=31(width), r13=42(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 82
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 201
LDI r7, 217
LDI r8, 13
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 96
LDI r12, 31
LDI r13, 42
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
