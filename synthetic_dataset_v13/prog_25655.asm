; DESCRIPTION: Composite: Draws a green line from (201, 63) to (269, 108) then Places a black dot at position (9, 204).
; PLAN: r0=201(x1), r1=63(y1), r2=269(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=204(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 63
LDI r2, 269
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 204
LDI r7, 0x000000
PSET r5, r6, r7
HALT
