; DESCRIPTION: Composite: Renders a red box of size 62x108 starting at (265, 102) then Renders a orange line between points (369, 219) and (299, 9).
; PLAN: r0=265(x), r1=102(y), r2=62(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=219(y1), r7=299(x2), r8=9(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 102
LDI r2, 62
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 219
LDI r7, 299
LDI r8, 9
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
