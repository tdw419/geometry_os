; DESCRIPTION: Draws a blue line from (317, 74) to (268, 91).
; PLAN: r0=317(x1), r1=74(y1), r2=268(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 74
LDI r2, 268
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
