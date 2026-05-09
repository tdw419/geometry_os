; DESCRIPTION: Draws a yellow line from (287, 235) to (300, 180).
; PLAN: r0=287(x1), r1=235(y1), r2=300(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 235
LDI r2, 300
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
