; DESCRIPTION: Composite: Sets a single blue pixel at (280, 168) then Draws a black line from (196, 157) to (283, 207).
; PLAN: r0=280(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=157(y1), r7=283(x2), r8=207(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 168
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 157
LDI r7, 283
LDI r8, 207
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
