; DESCRIPTION: Draws a white line from (171, 217) to (158, 176).
; PLAN: r0=171(x1), r1=217(y1), r2=158(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 217
LDI r2, 158
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
