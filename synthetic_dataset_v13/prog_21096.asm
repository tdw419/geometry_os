; DESCRIPTION: Composite: Draws a yellow line from (156, 139) to (117, 187) then Sets a single orange pixel at (214, 19).
; PLAN: r0=156(x1), r1=139(y1), r2=117(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 139
LDI r2, 117
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
