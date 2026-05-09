; DESCRIPTION: Composite: Sets a single yellow pixel at (79, 82) then Places a yellow circle of radius 20 at center (297, 62) then Draws a cyan line from (259, 51) to (374, 94).
; PLAN: r0=79(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=62(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x1), r11=51(y1), r12=374(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 62
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 51
LDI r12, 374
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
