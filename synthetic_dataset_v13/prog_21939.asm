; DESCRIPTION: Composite: Draws a cyan line from (341, 234) to (40, 183) then Places a green dot at position (461, 253).
; PLAN: r0=341(x1), r1=234(y1), r2=40(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 234
LDI r2, 40
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
