; DESCRIPTION: Composite: Sets a single purple pixel at (469, 90) then Places a purple 41x73 rectangle at position (103, 150) then Draws a orange circle centered at (268, 104) with radius 39.
; PLAN: r0=469(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=150(y), r7=41(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=104(y), r12=39(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 469
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 150
LDI r7, 41
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 104
LDI r12, 39
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
