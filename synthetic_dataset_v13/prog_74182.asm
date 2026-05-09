; DESCRIPTION: Composite: Places a purple dot at position (352, 142) then Renders a purple box of size 78x41 starting at (130, 163) then Draws a red circle centered at (161, 55) with radius 21.
; PLAN: r0=352(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=163(y), r7=78(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x), r11=55(y), r12=21(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 163
LDI r7, 78
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 55
LDI r12, 21
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
