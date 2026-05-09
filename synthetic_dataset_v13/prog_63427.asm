; DESCRIPTION: Draws a blue line from (61, 180) to (150, 53).
; PLAN: r0=61(x1), r1=180(y1), r2=150(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 180
LDI r2, 150
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
