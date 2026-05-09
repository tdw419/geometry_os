; DESCRIPTION: Composite: Draws a black line from (365, 178) to (380, 182) then Renders a yellow box of size 17x62 starting at (200, 160) then Sets a single white pixel at (162, 49).
; PLAN: r0=365(x1), r1=178(y1), r2=380(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=160(y), r7=17(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=49(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 178
LDI r2, 380
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 160
LDI r7, 17
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 49
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
