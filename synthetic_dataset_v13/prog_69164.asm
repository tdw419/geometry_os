; DESCRIPTION: Places a red line segment connecting (206, 35) to (363, 160).
; PLAN: r0=206(x1), r1=35(y1), r2=363(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 35
LDI r2, 363
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
