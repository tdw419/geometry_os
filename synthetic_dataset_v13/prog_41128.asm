; DESCRIPTION: Draws a blue line from (446, 81) to (187, 70).
; PLAN: r0=446(x1), r1=81(y1), r2=187(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 81
LDI r2, 187
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
