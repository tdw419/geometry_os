; DESCRIPTION: Places a orange line segment connecting (36, 176) to (425, 220).
; PLAN: r0=36(x1), r1=176(y1), r2=425(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 176
LDI r2, 425
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
