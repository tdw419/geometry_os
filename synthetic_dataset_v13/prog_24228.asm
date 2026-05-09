; DESCRIPTION: Composite: Renders a black disk with center (91, 114) and radius 43 then Renders a red line between points (13, 177) and (77, 251) then Places a orange 38x107 rectangle at position (296, 137).
; PLAN: r0=91(x), r1=114(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=177(y1), r7=77(x2), r8=251(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=137(y), r12=38(width), r13=107(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 114
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 177
LDI r7, 77
LDI r8, 251
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 137
LDI r12, 38
LDI r13, 107
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
