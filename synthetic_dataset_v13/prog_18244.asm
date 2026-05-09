; DESCRIPTION: Draws a blue line from (76, 138) to (94, 146).
; PLAN: r0=76(x1), r1=138(y1), r2=94(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 138
LDI r2, 94
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
