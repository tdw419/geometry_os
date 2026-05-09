; DESCRIPTION: Composite: Sets a single black pixel at (254, 205) then Draws a blue line from (35, 82) to (137, 97).
; PLAN: r0=254(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=82(y1), r7=137(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 35
LDI r6, 82
LDI r7, 137
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
