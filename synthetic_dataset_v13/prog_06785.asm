; DESCRIPTION: Composite: Draws a magenta line from (61, 148) to (52, 153) then Sets a single yellow pixel at (464, 6).
; PLAN: r0=61(x1), r1=148(y1), r2=52(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=6(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 148
LDI r2, 52
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 6
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
