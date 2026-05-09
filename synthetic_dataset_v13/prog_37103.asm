; DESCRIPTION: Draws a blue line from (154, 250) to (363, 238).
; PLAN: r0=154(x1), r1=250(y1), r2=363(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 250
LDI r2, 363
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
