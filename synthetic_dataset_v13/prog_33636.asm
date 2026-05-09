; DESCRIPTION: Composite: Draws a cyan line from (172, 171) to (344, 10) then Places a black dot at position (191, 39) then Places a black circle of radius 39 at center (101, 53).
; PLAN: r0=172(x1), r1=171(y1), r2=344(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=39(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=53(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 171
LDI r2, 344
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 39
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 101
LDI r11, 53
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
