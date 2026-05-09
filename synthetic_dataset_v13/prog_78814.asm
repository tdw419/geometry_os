; DESCRIPTION: Draws a green line from (204, 177) to (145, 235).
; PLAN: r0=204(x1), r1=177(y1), r2=145(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 177
LDI r2, 145
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
