; DESCRIPTION: Draws a blue line from (122, 79) to (437, 187).
; PLAN: r0=122(x1), r1=79(y1), r2=437(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 79
LDI r2, 437
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
