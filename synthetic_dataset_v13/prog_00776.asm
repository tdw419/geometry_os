; DESCRIPTION: Draws a orange line from (313, 59) to (355, 43).
; PLAN: r0=313(x1), r1=59(y1), r2=355(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 59
LDI r2, 355
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
