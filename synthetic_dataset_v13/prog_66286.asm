; DESCRIPTION: Composite: Draws a cyan line from (482, 15) to (95, 104) then Renders a red disk with center (155, 148) and radius 69.
; PLAN: r0=482(x1), r1=15(y1), r2=95(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=148(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 15
LDI r2, 95
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 148
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
