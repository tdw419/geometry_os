; DESCRIPTION: Draws a blue line from (445, 157) to (510, 216).
; PLAN: r0=445(x1), r1=157(y1), r2=510(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 157
LDI r2, 510
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
