; DESCRIPTION: Places a red line segment connecting (223, 180) to (61, 91).
; PLAN: r0=223(x1), r1=180(y1), r2=61(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 180
LDI r2, 61
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
