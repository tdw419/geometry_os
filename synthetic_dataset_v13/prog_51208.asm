; DESCRIPTION: Draws a black line from (330, 39) to (297, 235).
; PLAN: r0=330(x1), r1=39(y1), r2=297(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 39
LDI r2, 297
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
