; DESCRIPTION: Composite: Creates a cyan circular shape at (208, 158) with radius 73 then Draws a magenta line from (102, 112) to (26, 2) then Sets a single white pixel at (149, 240).
; PLAN: r0=208(x), r1=158(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x1), r6=112(y1), r7=26(x2), r8=2(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=240(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 158
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 112
LDI r7, 26
LDI r8, 2
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 240
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
