; DESCRIPTION: Draws a black line from (279, 212) to (378, 143).
; PLAN: r0=279(x1), r1=212(y1), r2=378(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 212
LDI r2, 378
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
