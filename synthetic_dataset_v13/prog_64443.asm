; DESCRIPTION: Renders a green line between points (387, 30) and (78, 235).
; PLAN: r0=387(x1), r1=30(y1), r2=78(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 30
LDI r2, 78
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
