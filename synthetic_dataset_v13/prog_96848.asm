; DESCRIPTION: Draws a white line from (489, 6) to (180, 46).
; PLAN: r0=489(x1), r1=6(y1), r2=180(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 6
LDI r2, 180
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
