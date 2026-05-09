; DESCRIPTION: Composite: Places a purple dot at position (220, 126) then Creates a white rectangular region at (381, 142) spanning 46 by 69 pixels then Places a cyan circle of radius 41 at center (362, 137).
; PLAN: r0=220(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=142(y), r7=46(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=362(x), r11=137(y), r12=41(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 142
LDI r7, 46
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 137
LDI r12, 41
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
