; DESCRIPTION: Composite: Renders a cyan line between points (429, 182) and (418, 213) then Places a orange dot at position (144, 116).
; PLAN: r0=429(x1), r1=182(y1), r2=418(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=116(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 182
LDI r2, 418
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 116
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
