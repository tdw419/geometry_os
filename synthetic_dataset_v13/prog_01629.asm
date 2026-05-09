; DESCRIPTION: Composite: Creates a purple circular shape at (332, 138) with radius 55 then Renders a green line between points (146, 52) and (111, 83) then Places a magenta 39x85 rectangle at position (51, 79).
; PLAN: r0=332(x), r1=138(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=52(y1), r7=111(x2), r8=83(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=79(y), r12=39(width), r13=85(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 138
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 52
LDI r7, 111
LDI r8, 83
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 79
LDI r12, 39
LDI r13, 85
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
