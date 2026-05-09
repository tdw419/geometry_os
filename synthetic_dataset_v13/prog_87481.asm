; DESCRIPTION: Places a white line segment connecting (262, 3) to (58, 160).
; PLAN: r0=262(x1), r1=3(y1), r2=58(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 3
LDI r2, 58
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
