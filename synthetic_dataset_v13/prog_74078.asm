; DESCRIPTION: Composite: Draws a yellow line from (342, 78) to (242, 76) then Places a black circle of radius 18 at center (292, 134) then Places a yellow dot at position (44, 126).
; PLAN: r0=342(x1), r1=78(y1), r2=242(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=134(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=126(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 78
LDI r2, 242
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 134
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 126
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
