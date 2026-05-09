; DESCRIPTION: Places a white line segment connecting (367, 178) to (162, 148).
; PLAN: r0=367(x1), r1=178(y1), r2=162(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 178
LDI r2, 162
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
