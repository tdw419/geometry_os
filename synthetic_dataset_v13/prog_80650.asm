; DESCRIPTION: Places a white line segment connecting (277, 204) to (317, 252).
; PLAN: r0=277(x1), r1=204(y1), r2=317(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 204
LDI r2, 317
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
