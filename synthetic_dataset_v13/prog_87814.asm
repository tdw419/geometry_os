; DESCRIPTION: Composite: Draws a red rectangle at (274, 61) with width 62 and height 118 then Places a cyan line segment connecting (293, 136) to (12, 159) then Creates a red circular shape at (345, 88) with radius 38.
; PLAN: r0=274(x), r1=61(y), r2=62(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=136(y1), r7=12(x2), r8=159(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=88(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 61
LDI r2, 62
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 136
LDI r7, 12
LDI r8, 159
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 88
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
