; DESCRIPTION: Places a white line segment connecting (178, 208) to (121, 250).
; PLAN: r0=178(x1), r1=208(y1), r2=121(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 208
LDI r2, 121
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
