; DESCRIPTION: Draws a magenta line from (431, 192) to (54, 235).
; PLAN: r0=431(x1), r1=192(y1), r2=54(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 192
LDI r2, 54
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
