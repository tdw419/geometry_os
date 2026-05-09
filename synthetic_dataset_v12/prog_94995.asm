; DESCRIPTION: Draws a blue line from (60, 67) to (50, 149).
; PLAN: r0=60(x1), r1=67(y1), r2=50(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 67
LDI r2, 50
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
