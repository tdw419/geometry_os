; DESCRIPTION: Composite: Sets a single yellow pixel at (50, 57) then Renders a orange line between points (306, 40) and (88, 126) then Places a magenta 79x60 rectangle at position (258, 189).
; PLAN: r0=50(x), r1=57(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=40(y1), r7=88(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=189(y), r12=79(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 57
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 306
LDI r6, 40
LDI r7, 88
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 189
LDI r12, 79
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
