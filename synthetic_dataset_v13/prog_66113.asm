; DESCRIPTION: Draws a green line from (343, 206) to (352, 147).
; PLAN: r0=343(x1), r1=206(y1), r2=352(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 206
LDI r2, 352
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
