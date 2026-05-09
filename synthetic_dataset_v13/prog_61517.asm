; DESCRIPTION: Draws a blue line from (4, 207) to (120, 103).
; PLAN: r0=4(x1), r1=207(y1), r2=120(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 207
LDI r2, 120
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
