; DESCRIPTION: Composite: Sets a single yellow pixel at (455, 41) then Draws a blue line from (337, 65) to (511, 98).
; PLAN: r0=455(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=65(y1), r7=511(x2), r8=98(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 337
LDI r6, 65
LDI r7, 511
LDI r8, 98
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
