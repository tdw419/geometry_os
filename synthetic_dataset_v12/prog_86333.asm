; DESCRIPTION: Composite: Places a black dot at position (226, 232) then Draws a purple line from (86, 105) to (264, 214).
; PLAN: r0=226(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=105(y1), r7=264(x2), r8=214(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 86
LDI r6, 105
LDI r7, 264
LDI r8, 214
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
