; DESCRIPTION: Draws a orange line from (368, 8) to (122, 235).
; PLAN: r0=368(x1), r1=8(y1), r2=122(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 8
LDI r2, 122
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
