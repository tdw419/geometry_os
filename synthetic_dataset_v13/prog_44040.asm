; DESCRIPTION: Composite: Sets a single red pixel at (10, 244) then Draws a blue line from (208, 58) to (501, 2).
; PLAN: r0=10(x), r1=244(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=58(y1), r7=501(x2), r8=2(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 244
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 208
LDI r6, 58
LDI r7, 501
LDI r8, 2
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
