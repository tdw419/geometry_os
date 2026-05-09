; DESCRIPTION: Places a white line segment connecting (109, 223) to (391, 132).
; PLAN: r0=109(x1), r1=223(y1), r2=391(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 223
LDI r2, 391
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
