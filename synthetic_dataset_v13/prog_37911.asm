; DESCRIPTION: Composite: Places a orange dot at position (268, 118) then Places a yellow line segment connecting (294, 14) to (253, 100) then Renders a white box of size 93x67 starting at (20, 110).
; PLAN: r0=268(x), r1=118(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=14(y1), r7=253(x2), r8=100(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=20(x), r11=110(y), r12=93(width), r13=67(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 118
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 294
LDI r6, 14
LDI r7, 253
LDI r8, 100
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 110
LDI r12, 93
LDI r13, 67
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
