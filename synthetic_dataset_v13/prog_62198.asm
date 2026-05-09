; DESCRIPTION: Draws a white line from (29, 190) to (180, 105).
; PLAN: r0=29(x1), r1=190(y1), r2=180(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 190
LDI r2, 180
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
