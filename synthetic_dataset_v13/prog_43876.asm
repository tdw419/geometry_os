; DESCRIPTION: Composite: Renders a green line between points (106, 122) and (107, 146) then Places a black dot at position (193, 248).
; PLAN: r0=106(x1), r1=122(y1), r2=107(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 122
LDI r2, 107
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
HALT
