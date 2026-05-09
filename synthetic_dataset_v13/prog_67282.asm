; DESCRIPTION: Composite: Renders a black box of size 112x105 starting at (212, 121) then Places a yellow line segment connecting (365, 18) to (99, 98) then Sets a single red pixel at (47, 66).
; PLAN: r0=212(x), r1=121(y), r2=112(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=18(y1), r7=99(x2), r8=98(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=66(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 121
LDI r2, 112
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 18
LDI r7, 99
LDI r8, 98
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 66
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
