; DESCRIPTION: Draws a white line from (331, 99) to (71, 94).
; PLAN: r0=331(x1), r1=99(y1), r2=71(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 99
LDI r2, 71
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
