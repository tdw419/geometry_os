; DESCRIPTION: Draws a green line from (31, 235) to (216, 196).
; PLAN: r0=31(x1), r1=235(y1), r2=216(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 235
LDI r2, 216
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
