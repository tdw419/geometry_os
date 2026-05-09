; DESCRIPTION: Composite: Sets a single yellow pixel at (337, 199) then Draws a orange line from (336, 111) to (19, 111).
; PLAN: r0=337(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=336(x1), r6=111(y1), r7=19(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 336
LDI r6, 111
LDI r7, 19
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
