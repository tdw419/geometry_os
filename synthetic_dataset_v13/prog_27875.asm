; DESCRIPTION: Draws a yellow line from (355, 33) to (39, 3).
; PLAN: r0=355(x1), r1=33(y1), r2=39(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 33
LDI r2, 39
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
