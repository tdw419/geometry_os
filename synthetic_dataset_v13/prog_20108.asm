; DESCRIPTION: Composite: Draws a cyan line from (102, 16) to (347, 80) then Places a red dot at position (498, 1) then Draws a blue circle centered at (117, 149) with radius 26.
; PLAN: r0=102(x1), r1=16(y1), r2=347(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=117(x), r11=149(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 16
LDI r2, 347
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 117
LDI r11, 149
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
