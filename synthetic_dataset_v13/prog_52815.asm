; DESCRIPTION: Draws a black line from (235, 221) to (412, 96).
; PLAN: r0=235(x1), r1=221(y1), r2=412(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 221
LDI r2, 412
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
