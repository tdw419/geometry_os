; DESCRIPTION: Places a red line segment connecting (230, 157) to (180, 18).
; PLAN: r0=230(x1), r1=157(y1), r2=180(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 157
LDI r2, 180
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
