; DESCRIPTION: Draws a yellow line from (198, 235) to (483, 175).
; PLAN: r0=198(x1), r1=235(y1), r2=483(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 235
LDI r2, 483
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
