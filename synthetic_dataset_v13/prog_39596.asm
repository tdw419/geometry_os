; DESCRIPTION: Draws a black line from (128, 235) to (374, 69).
; PLAN: r0=128(x1), r1=235(y1), r2=374(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 235
LDI r2, 374
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
