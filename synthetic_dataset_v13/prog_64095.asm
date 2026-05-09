; DESCRIPTION: Places a white line segment connecting (208, 181) to (90, 241).
; PLAN: r0=208(x1), r1=181(y1), r2=90(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 181
LDI r2, 90
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
