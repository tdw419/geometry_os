; DESCRIPTION: Draws a white line from (380, 47) to (490, 79).
; PLAN: r0=380(x1), r1=47(y1), r2=490(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 47
LDI r2, 490
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
