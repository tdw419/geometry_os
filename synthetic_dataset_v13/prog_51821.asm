; DESCRIPTION: Places a white line segment connecting (387, 12) to (323, 91).
; PLAN: r0=387(x1), r1=12(y1), r2=323(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 12
LDI r2, 323
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
