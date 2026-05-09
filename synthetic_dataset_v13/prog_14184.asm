; DESCRIPTION: Composite: Sets a single green pixel at (418, 166) then Draws a orange line from (402, 62) to (21, 166).
; PLAN: r0=418(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=62(y1), r7=21(x2), r8=166(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 402
LDI r6, 62
LDI r7, 21
LDI r8, 166
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
