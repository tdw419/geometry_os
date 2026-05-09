; DESCRIPTION: Places a white line segment connecting (349, 5) to (138, 187).
; PLAN: r0=349(x1), r1=5(y1), r2=138(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 5
LDI r2, 138
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
