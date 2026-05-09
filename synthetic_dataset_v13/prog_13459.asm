; DESCRIPTION: Composite: Places a purple dot at position (380, 26) then Draws a green rectangle at (89, 190) with width 100 and height 52 then Creates a green circular shape at (169, 142) with radius 36.
; PLAN: r0=380(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=190(y), r7=100(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=142(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 190
LDI r7, 100
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 142
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
