; DESCRIPTION: Draws a white line from (483, 133) to (121, 139).
; PLAN: r0=483(x1), r1=133(y1), r2=121(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 133
LDI r2, 121
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
