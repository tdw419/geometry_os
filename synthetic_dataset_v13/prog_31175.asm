; DESCRIPTION: Places a red line segment connecting (358, 254) to (90, 4).
; PLAN: r0=358(x1), r1=254(y1), r2=90(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 254
LDI r2, 90
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
