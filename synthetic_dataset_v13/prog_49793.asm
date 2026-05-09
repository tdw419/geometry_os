; DESCRIPTION: Draws a green line from (322, 68) to (235, 14).
; PLAN: r0=322(x1), r1=68(y1), r2=235(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 68
LDI r2, 235
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
