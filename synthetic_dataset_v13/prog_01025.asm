; DESCRIPTION: Draws a green line from (335, 161) to (483, 235).
; PLAN: r0=335(x1), r1=161(y1), r2=483(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 161
LDI r2, 483
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
