; DESCRIPTION: Places a white line segment connecting (188, 178) to (511, 162).
; PLAN: r0=188(x1), r1=178(y1), r2=511(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 178
LDI r2, 511
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
