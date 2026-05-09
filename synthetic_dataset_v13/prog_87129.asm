; DESCRIPTION: Places a purple line segment connecting (329, 153) to (283, 171).
; PLAN: r0=329(x1), r1=153(y1), r2=283(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 153
LDI r2, 283
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
