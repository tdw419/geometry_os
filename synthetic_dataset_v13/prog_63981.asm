; DESCRIPTION: Composite: Sets a single yellow pixel at (170, 178) then Draws a blue line from (423, 23) to (5, 255).
; PLAN: r0=170(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=23(y1), r7=5(x2), r8=255(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 23
LDI r7, 5
LDI r8, 255
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
