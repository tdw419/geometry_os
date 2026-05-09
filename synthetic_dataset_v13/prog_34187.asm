; DESCRIPTION: Places a red line segment connecting (193, 176) to (503, 155).
; PLAN: r0=193(x1), r1=176(y1), r2=503(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 176
LDI r2, 503
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
