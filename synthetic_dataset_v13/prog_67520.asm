; DESCRIPTION: Composite: Creates a green circular shape at (248, 163) with radius 68 then Places a orange 11x35 rectangle at position (232, 82) then Renders a blue line between points (324, 81) and (345, 193).
; PLAN: r0=248(x), r1=163(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=82(y), r7=11(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x1), r11=81(y1), r12=345(x2), r13=193(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 163
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 82
LDI r7, 11
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 81
LDI r12, 345
LDI r13, 193
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
