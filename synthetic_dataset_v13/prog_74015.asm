; DESCRIPTION: Composite: Renders a black line between points (0, 144) and (456, 253) then Places a green circle of radius 36 at center (102, 60) then Sets a single yellow pixel at (167, 128).
; PLAN: r0=0(x1), r1=144(y1), r2=456(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=60(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=128(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 0
LDI r1, 144
LDI r2, 456
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 60
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 128
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
