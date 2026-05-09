; DESCRIPTION: Places a white line segment connecting (408, 180) to (158, 91).
; PLAN: r0=408(x1), r1=180(y1), r2=158(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 180
LDI r2, 158
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
