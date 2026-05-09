; DESCRIPTION: Composite: Draws a green line from (391, 128) to (41, 172) then Creates a green circular shape at (368, 153) with radius 18 then Places a green dot at position (345, 220).
; PLAN: r0=391(x1), r1=128(y1), r2=41(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=153(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=220(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 128
LDI r2, 41
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 153
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 220
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
