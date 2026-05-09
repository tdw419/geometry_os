; DESCRIPTION: Composite: Places a red 81x108 rectangle at position (181, 85) then Places a black dot at position (372, 40) then Renders a red line between points (374, 7) and (66, 110).
; PLAN: r0=181(x), r1=85(y), r2=81(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=40(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=374(x1), r11=7(y1), r12=66(x2), r13=110(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 85
LDI r2, 81
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 40
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 374
LDI r11, 7
LDI r12, 66
LDI r13, 110
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
