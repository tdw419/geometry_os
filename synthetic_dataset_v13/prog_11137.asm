; DESCRIPTION: Composite: Draws a magenta line from (302, 166) to (31, 113) then Sets a single cyan pixel at (248, 241).
; PLAN: r0=302(x1), r1=166(y1), r2=31(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=241(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 166
LDI r2, 31
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 241
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
