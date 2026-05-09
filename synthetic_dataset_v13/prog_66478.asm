; DESCRIPTION: Composite: Renders a red disk with center (114, 44) and radius 41 then Places a white line segment connecting (511, 212) to (146, 14) then Places a black dot at position (194, 4).
; PLAN: r0=114(x), r1=44(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x1), r6=212(y1), r7=146(x2), r8=14(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=4(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 44
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 212
LDI r7, 146
LDI r8, 14
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 4
LDI r12, 0x000000
PSET r10, r11, r12
HALT
