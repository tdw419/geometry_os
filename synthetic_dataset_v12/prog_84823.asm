; DESCRIPTION: Composite: Draws a black line from (215, 28) to (502, 41) then Places a red dot at position (215, 187) then Creates a white circular shape at (121, 66) with radius 23.
; PLAN: r0=215(x1), r1=28(y1), r2=502(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=66(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 28
LDI r2, 502
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 121
LDI r11, 66
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
