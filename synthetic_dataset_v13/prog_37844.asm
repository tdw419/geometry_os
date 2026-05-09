; DESCRIPTION: Draws a white line from (447, 223) to (140, 153).
; PLAN: r0=447(x1), r1=223(y1), r2=140(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 223
LDI r2, 140
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
