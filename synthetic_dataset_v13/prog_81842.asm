; DESCRIPTION: Composite: Creates a purple rectangular region at (161, 23) spanning 25 by 114 pixels then Places a cyan dot at position (352, 36) then Creates a orange circular shape at (215, 140) with radius 55.
; PLAN: r0=161(x), r1=23(y), r2=25(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=140(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 23
LDI r2, 25
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 140
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
