; DESCRIPTION: Composite: Draws a purple line from (452, 170) to (439, 253) then Places a cyan dot at position (70, 112).
; PLAN: r0=452(x1), r1=170(y1), r2=439(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=112(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 170
LDI r2, 439
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 112
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
