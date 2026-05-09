; DESCRIPTION: Composite: Places a orange 70x47 rectangle at position (254, 64) then Places a orange circle of radius 14 at center (402, 195) then Renders a purple line between points (443, 78) and (201, 0).
; PLAN: r0=254(x), r1=64(y), r2=70(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=195(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x1), r11=78(y1), r12=201(x2), r13=0(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 64
LDI r2, 70
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 195
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 78
LDI r12, 201
LDI r13, 0
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
