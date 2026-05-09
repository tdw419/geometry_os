; DESCRIPTION: Composite: Renders a red line between points (44, 18) and (193, 242) then Sets a single orange pixel at (100, 8) then Places a cyan circle of radius 10 at center (344, 160).
; PLAN: r0=44(x1), r1=18(y1), r2=193(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=8(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=344(x), r11=160(y), r12=10(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 18
LDI r2, 193
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 8
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 344
LDI r11, 160
LDI r12, 10
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
