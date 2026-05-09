; DESCRIPTION: Composite: Draws a red line from (134, 142) to (124, 100) then Places a cyan circle of radius 15 at center (28, 75) then Places a purple dot at position (432, 181).
; PLAN: r0=134(x1), r1=142(y1), r2=124(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=75(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x), r11=181(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 142
LDI r2, 124
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 75
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 181
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
