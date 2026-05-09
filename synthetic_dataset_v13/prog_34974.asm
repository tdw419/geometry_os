; DESCRIPTION: Composite: Sets a single orange pixel at (78, 227) then Places a red 66x34 rectangle at position (36, 185) then Renders a purple line between points (213, 85) and (52, 78).
; PLAN: r0=78(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=185(y), r7=66(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x1), r11=85(y1), r12=52(x2), r13=78(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 36
LDI r6, 185
LDI r7, 66
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 85
LDI r12, 52
LDI r13, 78
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
