; DESCRIPTION: Draws a blue line from (258, 107) to (446, 84).
; PLAN: r0=258(x1), r1=107(y1), r2=446(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 107
LDI r2, 446
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
