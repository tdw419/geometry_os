; DESCRIPTION: Places a red line segment connecting (416, 229) to (363, 6).
; PLAN: r0=416(x1), r1=229(y1), r2=363(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 229
LDI r2, 363
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
