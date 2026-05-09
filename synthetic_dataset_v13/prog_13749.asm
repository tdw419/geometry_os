; DESCRIPTION: Renders a green line between points (322, 214) and (314, 235).
; PLAN: r0=322(x1), r1=214(y1), r2=314(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 214
LDI r2, 314
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
