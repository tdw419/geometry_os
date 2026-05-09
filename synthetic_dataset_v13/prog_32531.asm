; DESCRIPTION: Composite: Draws a white line from (193, 227) to (380, 136) then Draws a yellow circle centered at (363, 114) with radius 49 then Places a red 83x90 rectangle at position (41, 58).
; PLAN: r0=193(x1), r1=227(y1), r2=380(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=114(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x), r11=58(y), r12=83(width), r13=90(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 227
LDI r2, 380
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 114
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 58
LDI r12, 83
LDI r13, 90
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
