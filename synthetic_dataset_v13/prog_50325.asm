; DESCRIPTION: Draws a white line from (272, 44) to (61, 118).
; PLAN: r0=272(x1), r1=44(y1), r2=61(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 44
LDI r2, 61
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
