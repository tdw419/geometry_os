; DESCRIPTION: Draws a yellow line from (355, 44) to (171, 148).
; PLAN: r0=355(x1), r1=44(y1), r2=171(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 44
LDI r2, 171
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
