; DESCRIPTION: Composite: Draws a green line from (69, 208) to (511, 99) then Sets a single orange pixel at (372, 195).
; PLAN: r0=69(x1), r1=208(y1), r2=511(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=195(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 208
LDI r2, 511
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 195
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
