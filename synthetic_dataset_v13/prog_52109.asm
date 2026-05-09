; DESCRIPTION: Composite: Draws a green line from (395, 27) to (332, 190) then Sets a single orange pixel at (307, 153) then Places a cyan circle of radius 26 at center (336, 144).
; PLAN: r0=395(x1), r1=27(y1), r2=332(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=153(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=144(y), r12=26(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 27
LDI r2, 332
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 153
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 336
LDI r11, 144
LDI r12, 26
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
