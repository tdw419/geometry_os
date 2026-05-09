; DESCRIPTION: Composite: Places a purple dot at position (308, 11) then Places a cyan line segment connecting (129, 41) to (436, 245) then Creates a red rectangular region at (167, 45) spanning 101 by 70 pixels.
; PLAN: r0=308(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=41(y1), r7=436(x2), r8=245(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=45(y), r12=101(width), r13=70(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 41
LDI r7, 436
LDI r8, 245
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 45
LDI r12, 101
LDI r13, 70
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
