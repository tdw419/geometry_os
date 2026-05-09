; DESCRIPTION: Composite: Draws a cyan line from (268, 191) to (321, 208) then Places a black dot at position (191, 164) then Draws a cyan rectangle at (47, 41) with width 60 and height 49.
; PLAN: r0=268(x1), r1=191(y1), r2=321(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=164(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=41(y), r12=60(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 191
LDI r2, 321
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 164
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 47
LDI r11, 41
LDI r12, 60
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
