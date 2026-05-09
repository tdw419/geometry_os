; DESCRIPTION: Composite: Draws a red rectangle at (219, 182) with width 97 and height 31 then Places a white line segment connecting (93, 27) to (0, 47).
; PLAN: r0=219(x), r1=182(y), r2=97(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x1), r6=27(y1), r7=0(x2), r8=47(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 182
LDI r2, 97
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 27
LDI r7, 0
LDI r8, 47
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
