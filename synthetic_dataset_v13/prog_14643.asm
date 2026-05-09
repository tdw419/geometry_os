; DESCRIPTION: Draws a red line from (268, 235) to (322, 153).
; PLAN: r0=268(x1), r1=235(y1), r2=322(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 235
LDI r2, 322
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
