; DESCRIPTION: Draws a green line from (389, 120) to (366, 113).
; PLAN: r0=389(x1), r1=120(y1), r2=366(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 120
LDI r2, 366
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
