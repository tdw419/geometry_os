; DESCRIPTION: Places a white line segment connecting (82, 155) to (264, 220).
; PLAN: r0=82(x1), r1=155(y1), r2=264(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 155
LDI r2, 264
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
