; DESCRIPTION: Draws a white line from (31, 243) to (230, 121).
; PLAN: r0=31(x1), r1=243(y1), r2=230(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 243
LDI r2, 230
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
