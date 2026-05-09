; DESCRIPTION: Places a white line segment connecting (195, 56) to (132, 171).
; PLAN: r0=195(x1), r1=56(y1), r2=132(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 56
LDI r2, 132
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
