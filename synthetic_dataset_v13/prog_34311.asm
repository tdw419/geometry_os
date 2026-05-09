; DESCRIPTION: Draws a blue line from (445, 144) to (78, 85).
; PLAN: r0=445(x1), r1=144(y1), r2=78(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 144
LDI r2, 78
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
