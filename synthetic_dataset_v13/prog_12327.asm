; DESCRIPTION: Composite: Draws a cyan line from (414, 195) to (439, 245) then Places a purple dot at position (390, 71).
; PLAN: r0=414(x1), r1=195(y1), r2=439(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=71(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 195
LDI r2, 439
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 71
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
