; DESCRIPTION: Places a red line segment connecting (81, 223) to (359, 152).
; PLAN: r0=81(x1), r1=223(y1), r2=359(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 223
LDI r2, 359
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
