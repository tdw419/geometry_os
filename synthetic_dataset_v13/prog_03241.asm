; DESCRIPTION: Draws a magenta line from (393, 126) to (213, 235).
; PLAN: r0=393(x1), r1=126(y1), r2=213(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 126
LDI r2, 213
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
