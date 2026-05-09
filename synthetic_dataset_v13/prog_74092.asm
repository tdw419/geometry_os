; DESCRIPTION: Draws a white line from (203, 94) to (180, 140).
; PLAN: r0=203(x1), r1=94(y1), r2=180(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 94
LDI r2, 180
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
