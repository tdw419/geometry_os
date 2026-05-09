; DESCRIPTION: Places a white line segment connecting (491, 250) to (277, 40).
; PLAN: r0=491(x1), r1=250(y1), r2=277(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 250
LDI r2, 277
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
