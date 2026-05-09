; DESCRIPTION: Draws a yellow line from (475, 190) to (167, 235).
; PLAN: r0=475(x1), r1=190(y1), r2=167(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 190
LDI r2, 167
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
