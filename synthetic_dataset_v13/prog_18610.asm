; DESCRIPTION: Composite: Places a black line segment connecting (449, 220) to (361, 153) then Creates a red rectangular region at (77, 43) spanning 101 by 117 pixels.
; PLAN: r0=449(x1), r1=220(y1), r2=361(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=43(y), r7=101(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 220
LDI r2, 361
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 43
LDI r7, 101
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
