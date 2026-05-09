; DESCRIPTION: Draws a blue line from (384, 44) to (355, 161).
; PLAN: r0=384(x1), r1=44(y1), r2=355(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 44
LDI r2, 355
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
