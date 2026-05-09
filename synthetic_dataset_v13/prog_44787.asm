; DESCRIPTION: Composite: Sets a single yellow pixel at (29, 233) then Draws a blue line from (99, 103) to (98, 247).
; PLAN: r0=29(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=99(x1), r6=103(y1), r7=98(x2), r8=247(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 99
LDI r6, 103
LDI r7, 98
LDI r8, 247
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
