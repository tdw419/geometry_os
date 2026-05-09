; DESCRIPTION: Draws a blue line from (276, 16) to (216, 26).
; PLAN: r0=276(x1), r1=16(y1), r2=216(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 16
LDI r2, 216
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
