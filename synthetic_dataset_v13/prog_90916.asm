; DESCRIPTION: Composite: Creates a red circular shape at (471, 57) with radius 10 then Draws a orange line from (488, 179) to (462, 173).
; PLAN: r0=471(x), r1=57(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=179(y1), r7=462(x2), r8=173(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 57
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 179
LDI r7, 462
LDI r8, 173
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
