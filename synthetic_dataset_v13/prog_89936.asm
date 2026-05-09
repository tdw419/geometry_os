; DESCRIPTION: Draws a red line from (355, 43) to (221, 125).
; PLAN: r0=355(x1), r1=43(y1), r2=221(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 43
LDI r2, 221
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
