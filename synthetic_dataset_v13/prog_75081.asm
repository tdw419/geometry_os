; DESCRIPTION: Composite: Draws a black line from (77, 192) to (117, 166) then Sets a single red pixel at (207, 161).
; PLAN: r0=77(x1), r1=192(y1), r2=117(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=161(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 192
LDI r2, 117
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 161
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
