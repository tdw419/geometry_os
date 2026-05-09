; DESCRIPTION: Composite: Renders a white line between points (240, 72) and (256, 246) then Sets a single yellow pixel at (286, 231) then Places a orange circle of radius 76 at center (292, 124).
; PLAN: r0=240(x1), r1=72(y1), r2=256(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=231(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=124(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 72
LDI r2, 256
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 231
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 292
LDI r11, 124
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
