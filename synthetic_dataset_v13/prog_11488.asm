; DESCRIPTION: Composite: Draws a cyan line from (325, 215) to (451, 214) then Places a green dot at position (462, 11).
; PLAN: r0=325(x1), r1=215(y1), r2=451(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=11(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 215
LDI r2, 451
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 11
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
