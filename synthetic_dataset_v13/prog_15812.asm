; DESCRIPTION: Composite: Places a black dot at position (107, 156) then Draws a magenta line from (122, 109) to (480, 194).
; PLAN: r0=107(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=109(y1), r7=480(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 122
LDI r6, 109
LDI r7, 480
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
