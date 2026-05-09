; DESCRIPTION: Places a white line segment connecting (470, 121) to (250, 189).
; PLAN: r0=470(x1), r1=121(y1), r2=250(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 121
LDI r2, 250
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
