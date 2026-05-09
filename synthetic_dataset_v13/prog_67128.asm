; DESCRIPTION: Draws a white line from (235, 35) to (185, 96).
; PLAN: r0=235(x1), r1=35(y1), r2=185(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 35
LDI r2, 185
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
