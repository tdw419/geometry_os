; DESCRIPTION: Composite: Places a orange line segment connecting (423, 80) to (14, 71) then Renders a red box of size 73x50 starting at (13, 76).
; PLAN: r0=423(x1), r1=80(y1), r2=14(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=76(y), r7=73(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 80
LDI r2, 14
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 76
LDI r7, 73
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
