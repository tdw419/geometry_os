; DESCRIPTION: Composite: Renders a magenta line between points (455, 51) and (496, 235) then Places a cyan dot at position (29, 42).
; PLAN: r0=455(x1), r1=51(y1), r2=496(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 51
LDI r2, 496
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
