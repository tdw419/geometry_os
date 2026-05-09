; DESCRIPTION: Draws a white line from (65, 40) to (3, 94).
; PLAN: r0=65(x1), r1=40(y1), r2=3(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 40
LDI r2, 3
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
