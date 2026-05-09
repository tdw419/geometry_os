; DESCRIPTION: Composite: Draws a magenta line from (211, 173) to (305, 190) then Places a black dot at position (194, 1).
; PLAN: r0=211(x1), r1=173(y1), r2=305(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=1(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 173
LDI r2, 305
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 1
LDI r7, 0x000000
PSET r5, r6, r7
HALT
