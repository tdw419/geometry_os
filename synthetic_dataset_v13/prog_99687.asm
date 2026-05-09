; DESCRIPTION: Draws a blue line from (221, 125) to (98, 30).
; PLAN: r0=221(x1), r1=125(y1), r2=98(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 125
LDI r2, 98
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
