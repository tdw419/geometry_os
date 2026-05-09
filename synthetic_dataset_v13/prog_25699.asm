; DESCRIPTION: Composite: Places a black 23x43 rectangle at position (149, 149) then Renders a green line between points (350, 71) and (315, 137) then Sets a single green pixel at (121, 121).
; PLAN: r0=149(x), r1=149(y), r2=23(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=71(y1), r7=315(x2), r8=137(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=121(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 149
LDI r2, 23
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 71
LDI r7, 315
LDI r8, 137
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 121
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
