; DESCRIPTION: Draws a red line from (326, 93) to (200, 172).
; PLAN: r0=326(x1), r1=93(y1), r2=200(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 93
LDI r2, 200
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
