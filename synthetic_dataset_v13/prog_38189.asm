; DESCRIPTION: Draws a green line from (315, 56) to (13, 235).
; PLAN: r0=315(x1), r1=56(y1), r2=13(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 56
LDI r2, 13
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
