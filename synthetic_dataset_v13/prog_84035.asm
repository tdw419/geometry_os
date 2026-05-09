; DESCRIPTION: Draws a green line from (32, 134) to (389, 180).
; PLAN: r0=32(x1), r1=134(y1), r2=389(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 134
LDI r2, 389
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
