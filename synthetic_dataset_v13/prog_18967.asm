; DESCRIPTION: Places a red line segment connecting (464, 158) to (140, 209).
; PLAN: r0=464(x1), r1=158(y1), r2=140(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 158
LDI r2, 140
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
