; DESCRIPTION: Draws a yellow line from (231, 174) to (459, 235).
; PLAN: r0=231(x1), r1=174(y1), r2=459(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 174
LDI r2, 459
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
