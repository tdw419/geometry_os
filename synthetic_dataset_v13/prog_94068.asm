; DESCRIPTION: Composite: Places a red dot at position (348, 133) then Places a green line segment connecting (268, 2) to (468, 52) then Renders a cyan disk with center (164, 137) and radius 65.
; PLAN: r0=348(x), r1=133(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=2(y1), r7=468(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=137(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 133
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 2
LDI r7, 468
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 137
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
