; DESCRIPTION: Composite: Places a orange dot at position (418, 77) then Draws a orange line from (294, 111) to (263, 102).
; PLAN: r0=418(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=111(y1), r7=263(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 294
LDI r6, 111
LDI r7, 263
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
