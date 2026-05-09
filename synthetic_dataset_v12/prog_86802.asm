; DESCRIPTION: Draws a yellow line from (162, 235) to (203, 214).
; PLAN: r0=162(x1), r1=235(y1), r2=203(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 235
LDI r2, 203
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
