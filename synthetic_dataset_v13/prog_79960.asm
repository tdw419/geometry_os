; DESCRIPTION: Draws a blue line from (5, 93) to (151, 221).
; PLAN: r0=5(x1), r1=93(y1), r2=151(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 93
LDI r2, 151
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
