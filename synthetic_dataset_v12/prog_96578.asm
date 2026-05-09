; DESCRIPTION: Composite: Draws a blue line from (483, 153) to (480, 202) then Creates a black rectangular region at (477, 1) spanning 14 by 76 pixels.
; PLAN: r0=483(x1), r1=153(y1), r2=480(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=1(y), r7=14(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 153
LDI r2, 480
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 1
LDI r7, 14
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
