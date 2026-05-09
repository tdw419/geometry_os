; DESCRIPTION: Places a red line segment connecting (195, 200) to (89, 113).
; PLAN: r0=195(x1), r1=200(y1), r2=89(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 200
LDI r2, 89
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
