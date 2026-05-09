; DESCRIPTION: Composite: Draws a yellow line from (78, 150) to (138, 131) then Creates a orange rectangular region at (241, 131) spanning 104 by 75 pixels.
; PLAN: r0=78(x1), r1=150(y1), r2=138(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=131(y), r7=104(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 150
LDI r2, 138
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 131
LDI r7, 104
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
