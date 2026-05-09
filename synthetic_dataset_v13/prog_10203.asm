; DESCRIPTION: Composite: Draws a red rectangle at (361, 15) with width 18 and height 46 then Places a cyan dot at position (311, 217) then Renders a black line between points (103, 142) and (246, 121).
; PLAN: r0=361(x), r1=15(y), r2=18(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x1), r11=142(y1), r12=246(x2), r13=121(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 15
LDI r2, 18
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 142
LDI r12, 246
LDI r13, 121
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
