; DESCRIPTION: Composite: Draws a cyan line from (509, 236) to (166, 235) then Places a black dot at position (506, 58).
; PLAN: r0=509(x1), r1=236(y1), r2=166(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=58(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 509
LDI r1, 236
LDI r2, 166
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 58
LDI r7, 0x000000
PSET r5, r6, r7
HALT
