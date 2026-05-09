; DESCRIPTION: Places a yellow line segment connecting (47, 133) to (340, 235).
; PLAN: r0=47(x1), r1=133(y1), r2=340(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 133
LDI r2, 340
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
