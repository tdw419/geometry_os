; DESCRIPTION: Composite: Renders a yellow line between points (5, 168) and (204, 41) then Sets a single orange pixel at (361, 95) then Creates a cyan circular shape at (215, 62) with radius 55.
; PLAN: r0=5(x1), r1=168(y1), r2=204(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=95(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=62(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 5
LDI r1, 168
LDI r2, 204
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 95
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 215
LDI r11, 62
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
