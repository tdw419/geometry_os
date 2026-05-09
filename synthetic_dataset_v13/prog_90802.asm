; DESCRIPTION: Composite: Draws a magenta line from (292, 65) to (412, 17) then Sets a single green pixel at (202, 43).
; PLAN: r0=292(x1), r1=65(y1), r2=412(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=43(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 65
LDI r2, 412
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 43
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
