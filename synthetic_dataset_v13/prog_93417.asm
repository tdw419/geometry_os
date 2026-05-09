; DESCRIPTION: Places a red line segment connecting (271, 169) to (491, 236).
; PLAN: r0=271(x1), r1=169(y1), r2=491(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 169
LDI r2, 491
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
