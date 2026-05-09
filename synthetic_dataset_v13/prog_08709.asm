; DESCRIPTION: Draws a yellow line from (317, 59) to (338, 119).
; PLAN: r0=317(x1), r1=59(y1), r2=338(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 59
LDI r2, 338
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
