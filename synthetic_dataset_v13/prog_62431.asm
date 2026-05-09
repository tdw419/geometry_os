; DESCRIPTION: Draws a red line from (483, 235) to (461, 82).
; PLAN: r0=483(x1), r1=235(y1), r2=461(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 235
LDI r2, 461
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
