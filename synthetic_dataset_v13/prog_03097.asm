; DESCRIPTION: Places a red line segment connecting (464, 70) to (3, 9).
; PLAN: r0=464(x1), r1=70(y1), r2=3(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 70
LDI r2, 3
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
