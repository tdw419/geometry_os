; DESCRIPTION: Draws a blue line from (446, 34) to (199, 226).
; PLAN: r0=446(x1), r1=34(y1), r2=199(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 34
LDI r2, 199
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
