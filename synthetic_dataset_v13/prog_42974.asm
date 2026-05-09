; DESCRIPTION: Composite: Places a magenta 93x82 rectangle at position (211, 74) then Places a black line segment connecting (41, 1) to (342, 85) then Renders a orange disk with center (152, 167) and radius 68.
; PLAN: r0=211(x), r1=74(y), r2=93(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=1(y1), r7=342(x2), r8=85(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=167(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 74
LDI r2, 93
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 1
LDI r7, 342
LDI r8, 85
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 167
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
