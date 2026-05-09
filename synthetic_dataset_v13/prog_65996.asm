; DESCRIPTION: Draws a yellow line from (353, 38) to (252, 235).
; PLAN: r0=353(x1), r1=38(y1), r2=252(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 38
LDI r2, 252
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
