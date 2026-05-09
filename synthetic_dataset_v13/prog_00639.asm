; DESCRIPTION: Composite: Renders a orange line between points (328, 167) and (183, 235) then Creates a white rectangular region at (182, 4) spanning 97 by 44 pixels.
; PLAN: r0=328(x1), r1=167(y1), r2=183(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=4(y), r7=97(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 167
LDI r2, 183
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 4
LDI r7, 97
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
