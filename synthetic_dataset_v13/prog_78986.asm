; DESCRIPTION: Composite: Renders a cyan line between points (303, 168) and (366, 230) then Sets a single black pixel at (447, 143) then Renders a yellow disk with center (68, 99) and radius 42.
; PLAN: r0=303(x1), r1=168(y1), r2=366(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=143(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=99(y), r12=42(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 168
LDI r2, 366
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 143
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 68
LDI r11, 99
LDI r12, 42
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
