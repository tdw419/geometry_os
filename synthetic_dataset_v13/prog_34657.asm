; DESCRIPTION: Places a green line segment connecting (71, 112) to (235, 65).
; PLAN: r0=71(x1), r1=112(y1), r2=235(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 112
LDI r2, 235
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
