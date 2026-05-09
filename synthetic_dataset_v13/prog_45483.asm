; DESCRIPTION: Draws a yellow line from (355, 178) to (235, 240).
; PLAN: r0=355(x1), r1=178(y1), r2=235(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 178
LDI r2, 235
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
