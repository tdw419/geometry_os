; DESCRIPTION: Composite: Places a purple dot at position (169, 200) then Draws a purple rectangle at (368, 198) with width 119 and height 53.
; PLAN: r0=169(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=198(y), r7=119(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 198
LDI r7, 119
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
