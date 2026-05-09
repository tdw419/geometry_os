; DESCRIPTION: Places a red line segment connecting (315, 180) to (39, 39).
; PLAN: r0=315(x1), r1=180(y1), r2=39(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 180
LDI r2, 39
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
