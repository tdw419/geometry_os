; DESCRIPTION: Composite: Renders a cyan line between points (0, 204) and (368, 30) then Sets a single black pixel at (176, 32) then Places a red circle of radius 45 at center (108, 179).
; PLAN: r0=0(x1), r1=204(y1), r2=368(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=179(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 204
LDI r2, 368
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 108
LDI r11, 179
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
