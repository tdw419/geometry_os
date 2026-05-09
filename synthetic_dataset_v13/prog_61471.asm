; DESCRIPTION: Composite: Places a orange line segment connecting (294, 198) to (262, 172) then Renders a yellow box of size 70x56 starting at (35, 2).
; PLAN: r0=294(x1), r1=198(y1), r2=262(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=2(y), r7=70(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 198
LDI r2, 262
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 2
LDI r7, 70
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
