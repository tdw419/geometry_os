; DESCRIPTION: Draws a red line from (140, 178) to (355, 0).
; PLAN: r0=140(x1), r1=178(y1), r2=355(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 178
LDI r2, 355
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
