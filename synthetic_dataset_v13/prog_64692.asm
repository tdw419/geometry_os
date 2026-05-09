; DESCRIPTION: Renders a yellow line between points (455, 251) and (36, 235).
; PLAN: r0=455(x1), r1=251(y1), r2=36(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 251
LDI r2, 36
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
