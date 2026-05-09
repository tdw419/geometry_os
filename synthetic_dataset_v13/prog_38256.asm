; DESCRIPTION: Composite: Places a magenta line segment connecting (79, 9) to (447, 8) then Places a orange 88x119 rectangle at position (79, 41).
; PLAN: r0=79(x1), r1=9(y1), r2=447(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=41(y), r7=88(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 9
LDI r2, 447
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 41
LDI r7, 88
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
