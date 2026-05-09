; DESCRIPTION: Places a purple line segment connecting (487, 112) to (113, 235).
; PLAN: r0=487(x1), r1=112(y1), r2=113(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 112
LDI r2, 113
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
