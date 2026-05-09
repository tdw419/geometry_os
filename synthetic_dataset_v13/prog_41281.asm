; DESCRIPTION: Composite: Renders a blue line between points (43, 187) and (235, 176) then Places a purple dot at position (218, 10).
; PLAN: r0=43(x1), r1=187(y1), r2=235(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=10(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 187
LDI r2, 235
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 10
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
