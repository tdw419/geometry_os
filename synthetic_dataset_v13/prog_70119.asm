; DESCRIPTION: Draws a red line from (326, 171) to (238, 205).
; PLAN: r0=326(x1), r1=171(y1), r2=238(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 171
LDI r2, 238
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
