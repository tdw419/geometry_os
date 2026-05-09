; DESCRIPTION: Draws a red line from (249, 241) to (214, 235).
; PLAN: r0=249(x1), r1=241(y1), r2=214(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 241
LDI r2, 214
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
