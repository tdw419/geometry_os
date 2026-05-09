; DESCRIPTION: Composite: Renders a orange line between points (451, 223) and (12, 15) then Creates a magenta rectangular region at (82, 104) spanning 57 by 50 pixels.
; PLAN: r0=451(x1), r1=223(y1), r2=12(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=104(y), r7=57(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 223
LDI r2, 12
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 104
LDI r7, 57
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
