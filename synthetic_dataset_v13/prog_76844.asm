; DESCRIPTION: Composite: Draws a magenta line from (423, 176) to (161, 28) then Sets a single blue pixel at (164, 239).
; PLAN: r0=423(x1), r1=176(y1), r2=161(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 176
LDI r2, 161
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
