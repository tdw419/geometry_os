; DESCRIPTION: Places a white line segment connecting (180, 167) to (234, 191).
; PLAN: r0=180(x1), r1=167(y1), r2=234(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 167
LDI r2, 234
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
