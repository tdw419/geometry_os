; DESCRIPTION: Places a red line segment connecting (64, 133) to (105, 91).
; PLAN: r0=64(x1), r1=133(y1), r2=105(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 133
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
