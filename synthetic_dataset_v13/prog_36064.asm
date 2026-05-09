; DESCRIPTION: Draws a blue line from (445, 78) to (302, 178).
; PLAN: r0=445(x1), r1=78(y1), r2=302(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 78
LDI r2, 302
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
