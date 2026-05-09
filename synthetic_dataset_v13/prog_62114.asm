; DESCRIPTION: Composite: Sets a single magenta pixel at (449, 152) then Draws a orange line from (125, 176) to (260, 168).
; PLAN: r0=449(x), r1=152(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=176(y1), r7=260(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 152
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 176
LDI r7, 260
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
