; DESCRIPTION: Draws a magenta line from (468, 235) to (443, 235).
; PLAN: r0=468(x1), r1=235(y1), r2=443(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 235
LDI r2, 443
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
