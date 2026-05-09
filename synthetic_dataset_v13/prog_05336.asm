; DESCRIPTION: Draws a blue line from (317, 206) to (358, 93).
; PLAN: r0=317(x1), r1=206(y1), r2=358(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 206
LDI r2, 358
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
