; DESCRIPTION: Composite: Draws a green line from (83, 94) to (325, 21) then Places a blue dot at position (401, 143).
; PLAN: r0=83(x1), r1=94(y1), r2=325(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=143(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 94
LDI r2, 325
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 143
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
