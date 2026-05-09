; DESCRIPTION: Places a yellow line segment connecting (235, 140) to (285, 70).
; PLAN: r0=235(x1), r1=140(y1), r2=285(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 140
LDI r2, 285
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
