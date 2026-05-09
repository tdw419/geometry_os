; DESCRIPTION: Composite: Places a red dot at position (56, 132) then Renders a orange line between points (388, 4) and (509, 125).
; PLAN: r0=56(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=4(y1), r7=509(x2), r8=125(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 4
LDI r7, 509
LDI r8, 125
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
