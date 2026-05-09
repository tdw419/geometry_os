; DESCRIPTION: Composite: Renders a red line between points (293, 86) and (122, 41) then Creates a orange circular shape at (206, 87) with radius 78 then Places a orange 52x50 rectangle at position (160, 195).
; PLAN: r0=293(x1), r1=86(y1), r2=122(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=87(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=195(y), r12=52(width), r13=50(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 86
LDI r2, 122
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 87
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 195
LDI r12, 52
LDI r13, 50
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
