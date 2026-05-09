; DESCRIPTION: Draws a magenta line from (403, 20) to (102, 235).
; PLAN: r0=403(x1), r1=20(y1), r2=102(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 20
LDI r2, 102
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
