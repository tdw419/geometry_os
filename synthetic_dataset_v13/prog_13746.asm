; DESCRIPTION: Composite: Sets a single blue pixel at (227, 154) then Draws a blue line from (223, 171) to (418, 160).
; PLAN: r0=227(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x1), r6=171(y1), r7=418(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 171
LDI r7, 418
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
