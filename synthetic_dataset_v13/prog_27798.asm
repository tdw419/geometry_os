; DESCRIPTION: Draws a green line from (462, 38) to (235, 165).
; PLAN: r0=462(x1), r1=38(y1), r2=235(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 38
LDI r2, 235
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
