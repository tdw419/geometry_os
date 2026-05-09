; DESCRIPTION: Composite: Draws a yellow line from (236, 27) to (40, 175) then Sets a single green pixel at (29, 149).
; PLAN: r0=236(x1), r1=27(y1), r2=40(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=149(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 27
LDI r2, 40
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 149
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
