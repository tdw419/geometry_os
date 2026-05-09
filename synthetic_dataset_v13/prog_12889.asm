; DESCRIPTION: Composite: Draws a blue circle centered at (105, 171) with radius 72 then Draws a red line from (430, 191) to (10, 182).
; PLAN: r0=105(x), r1=171(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x1), r6=191(y1), r7=10(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 171
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 191
LDI r7, 10
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
