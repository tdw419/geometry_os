; DESCRIPTION: Draws a blue line from (317, 120) to (30, 70).
; PLAN: r0=317(x1), r1=120(y1), r2=30(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 120
LDI r2, 30
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
