; DESCRIPTION: Places a red line segment connecting (324, 180) to (216, 65).
; PLAN: r0=324(x1), r1=180(y1), r2=216(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 180
LDI r2, 216
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
