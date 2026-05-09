; DESCRIPTION: Draws a orange line from (256, 141) to (355, 161).
; PLAN: r0=256(x1), r1=141(y1), r2=355(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 141
LDI r2, 355
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
