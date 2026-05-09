; DESCRIPTION: Composite: Renders a red box of size 18x36 starting at (400, 17) then Places a red line segment connecting (312, 23) to (49, 59).
; PLAN: r0=400(x), r1=17(y), r2=18(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=23(y1), r7=49(x2), r8=59(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 17
LDI r2, 18
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 23
LDI r7, 49
LDI r8, 59
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
