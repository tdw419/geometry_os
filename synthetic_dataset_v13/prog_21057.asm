; DESCRIPTION: Places a red line segment connecting (301, 51) to (431, 236).
; PLAN: r0=301(x1), r1=51(y1), r2=431(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 51
LDI r2, 431
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
