; DESCRIPTION: Composite: Draws a black line from (460, 19) to (469, 168) then Creates a blue circular shape at (411, 156) with radius 70.
; PLAN: r0=460(x1), r1=19(y1), r2=469(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=156(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 19
LDI r2, 469
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 156
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
