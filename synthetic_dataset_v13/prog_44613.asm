; DESCRIPTION: Composite: Places a blue 30x50 rectangle at position (378, 85) then Draws a green line from (481, 123) to (41, 124) then Places a cyan circle of radius 51 at center (276, 131).
; PLAN: r0=378(x), r1=85(y), r2=30(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=123(y1), r7=41(x2), r8=124(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=131(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 85
LDI r2, 30
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 123
LDI r7, 41
LDI r8, 124
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 131
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
