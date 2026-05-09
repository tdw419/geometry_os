; DESCRIPTION: Places a white line segment connecting (178, 229) to (233, 193).
; PLAN: r0=178(x1), r1=229(y1), r2=233(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 229
LDI r2, 233
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
