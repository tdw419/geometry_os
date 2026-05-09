; DESCRIPTION: Composite: Renders a cyan line between points (131, 58) and (421, 0) then Places a red 98x11 rectangle at position (227, 142) then Creates a orange circular shape at (391, 179) with radius 37.
; PLAN: r0=131(x1), r1=58(y1), r2=421(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=142(y), r7=98(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=179(y), r12=37(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 58
LDI r2, 421
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 142
LDI r7, 98
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 179
LDI r12, 37
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
