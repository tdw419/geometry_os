; DESCRIPTION: Draws a white line from (26, 94) to (86, 170).
; PLAN: r0=26(x1), r1=94(y1), r2=86(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 94
LDI r2, 86
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
