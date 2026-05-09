; DESCRIPTION: Places a red line segment connecting (87, 151) to (222, 180).
; PLAN: r0=87(x1), r1=151(y1), r2=222(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 151
LDI r2, 222
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
