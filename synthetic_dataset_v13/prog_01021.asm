; DESCRIPTION: Composite: Places a blue dot at position (321, 172) then Draws a black line from (107, 232) to (126, 50).
; PLAN: r0=321(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=232(y1), r7=126(x2), r8=50(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 232
LDI r7, 126
LDI r8, 50
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
