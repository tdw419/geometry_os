; DESCRIPTION: Draws a blue line from (317, 113) to (37, 166).
; PLAN: r0=317(x1), r1=113(y1), r2=37(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 113
LDI r2, 37
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
