; DESCRIPTION: Composite: Draws a magenta line from (116, 84) to (458, 223) then Places a black dot at position (118, 137).
; PLAN: r0=116(x1), r1=84(y1), r2=458(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=137(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 84
LDI r2, 458
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 137
LDI r7, 0x000000
PSET r5, r6, r7
HALT
