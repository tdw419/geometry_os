; DESCRIPTION: Places a white line segment connecting (208, 5) to (63, 91).
; PLAN: r0=208(x1), r1=5(y1), r2=63(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 5
LDI r2, 63
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
