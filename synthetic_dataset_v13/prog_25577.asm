; DESCRIPTION: Draws a red line from (388, 175) to (326, 149).
; PLAN: r0=388(x1), r1=175(y1), r2=326(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 175
LDI r2, 326
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
