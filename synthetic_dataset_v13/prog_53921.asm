; DESCRIPTION: Composite: Draws a cyan line from (369, 14) to (442, 101) then Draws a orange circle centered at (125, 139) with radius 47.
; PLAN: r0=369(x1), r1=14(y1), r2=442(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=139(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 14
LDI r2, 442
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 139
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
