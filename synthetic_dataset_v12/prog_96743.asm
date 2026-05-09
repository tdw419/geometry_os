; DESCRIPTION: Composite: Places a cyan dot at position (315, 240) then Places a yellow line segment connecting (50, 231) to (455, 229) then Renders a red disk with center (134, 49) and radius 41.
; PLAN: r0=315(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=50(x1), r6=231(y1), r7=455(x2), r8=229(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=49(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 231
LDI r7, 455
LDI r8, 229
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 49
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
