; DESCRIPTION: Draws a white line from (171, 212) to (427, 148).
; PLAN: r0=171(x1), r1=212(y1), r2=427(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 212
LDI r2, 427
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
