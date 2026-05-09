; DESCRIPTION: Composite: Draws a green line from (411, 49) to (434, 205) then Renders a red disk with center (128, 169) and radius 73 then Sets a single yellow pixel at (120, 227).
; PLAN: r0=411(x1), r1=49(y1), r2=434(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=169(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 49
LDI r2, 434
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 169
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
