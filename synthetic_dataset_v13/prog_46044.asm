; DESCRIPTION: Composite: Places a yellow line segment connecting (489, 148) to (448, 11) then Places a magenta dot at position (73, 215).
; PLAN: r0=489(x1), r1=148(y1), r2=448(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=215(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 489
LDI r1, 148
LDI r2, 448
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 215
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
