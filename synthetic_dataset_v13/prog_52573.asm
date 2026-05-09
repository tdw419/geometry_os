; DESCRIPTION: Composite: Sets a single yellow pixel at (339, 168) then Renders a orange line between points (483, 146) and (400, 160) then Places a cyan circle of radius 57 at center (312, 84).
; PLAN: r0=339(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=146(y1), r7=400(x2), r8=160(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=84(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 483
LDI r6, 146
LDI r7, 400
LDI r8, 160
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 84
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
