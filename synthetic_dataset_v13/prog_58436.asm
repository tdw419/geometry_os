; DESCRIPTION: Draws a green line from (140, 120) to (339, 217).
; PLAN: r0=140(x1), r1=120(y1), r2=339(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 120
LDI r2, 339
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
