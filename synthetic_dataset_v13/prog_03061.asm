; DESCRIPTION: Draws a yellow line from (104, 142) to (326, 235).
; PLAN: r0=104(x1), r1=142(y1), r2=326(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 142
LDI r2, 326
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
