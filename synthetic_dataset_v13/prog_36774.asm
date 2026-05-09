; DESCRIPTION: Composite: Renders a orange box of size 68x104 starting at (9, 33) then Places a orange line segment connecting (266, 52) to (2, 252).
; PLAN: r0=9(x), r1=33(y), r2=68(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=52(y1), r7=2(x2), r8=252(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 33
LDI r2, 68
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 52
LDI r7, 2
LDI r8, 252
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
