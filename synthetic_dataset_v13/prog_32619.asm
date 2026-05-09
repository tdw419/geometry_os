; DESCRIPTION: Draws a red line from (216, 122) to (263, 218).
; PLAN: r0=216(x1), r1=122(y1), r2=263(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 122
LDI r2, 263
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
