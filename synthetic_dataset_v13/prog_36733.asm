; DESCRIPTION: Places a green line segment connecting (174, 43) to (174, 162).
; PLAN: r0=174(x1), r1=43(y1), r2=174(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 43
LDI r2, 174
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
