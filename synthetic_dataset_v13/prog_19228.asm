; DESCRIPTION: Draws a orange line from (410, 44) to (355, 238).
; PLAN: r0=410(x1), r1=44(y1), r2=355(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 44
LDI r2, 355
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
