; DESCRIPTION: Composite: Draws a blue line from (439, 170) to (56, 249) then Places a cyan dot at position (274, 133).
; PLAN: r0=439(x1), r1=170(y1), r2=56(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=133(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 170
LDI r2, 56
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 133
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
