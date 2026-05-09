; DESCRIPTION: Composite: Creates a purple rectangular region at (23, 4) spanning 88 by 109 pixels then Renders a white line between points (477, 46) and (167, 222) then Places a yellow circle of radius 12 at center (265, 141).
; PLAN: r0=23(x), r1=4(y), r2=88(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x1), r6=46(y1), r7=167(x2), r8=222(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=141(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 4
LDI r2, 88
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 46
LDI r7, 167
LDI r8, 222
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 141
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
