; DESCRIPTION: Composite: Renders a orange line between points (275, 141) and (495, 163) then Places a white 43x118 rectangle at position (190, 47).
; PLAN: r0=275(x1), r1=141(y1), r2=495(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=47(y), r7=43(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 141
LDI r2, 495
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 47
LDI r7, 43
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
