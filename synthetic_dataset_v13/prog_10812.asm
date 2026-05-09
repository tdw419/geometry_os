; DESCRIPTION: Draws a white line from (106, 4) to (508, 70).
; PLAN: r0=106(x1), r1=4(y1), r2=508(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 4
LDI r2, 508
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
