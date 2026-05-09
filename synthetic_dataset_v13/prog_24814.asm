; DESCRIPTION: Draws a magenta line from (20, 12) to (161, 133).
; PLAN: r0=20(x1), r1=12(y1), r2=161(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 12
LDI r2, 161
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
