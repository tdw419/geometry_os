; DESCRIPTION: Draws a white line from (129, 140) to (146, 4).
; PLAN: r0=129(x1), r1=140(y1), r2=146(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 140
LDI r2, 146
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
