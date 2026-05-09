; DESCRIPTION: Composite: Places a orange dot at position (71, 96) then Places a purple line segment connecting (238, 163) to (41, 98) then Draws a orange rectangle at (443, 15) with width 15 and height 48.
; PLAN: r0=71(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=163(y1), r7=41(x2), r8=98(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=15(y), r12=15(width), r13=48(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 238
LDI r6, 163
LDI r7, 41
LDI r8, 98
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 15
LDI r12, 15
LDI r13, 48
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
