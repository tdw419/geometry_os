; DESCRIPTION: Places a blue line segment connecting (115, 171) to (502, 162).
; PLAN: r0=115(x1), r1=171(y1), r2=502(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 171
LDI r2, 502
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
