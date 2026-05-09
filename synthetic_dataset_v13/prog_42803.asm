; DESCRIPTION: Draws a black line from (148, 1) to (12, 235).
; PLAN: r0=148(x1), r1=1(y1), r2=12(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 1
LDI r2, 12
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
