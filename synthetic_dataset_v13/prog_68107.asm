; DESCRIPTION: Draws a white line from (47, 23) to (87, 109).
; PLAN: r0=47(x1), r1=23(y1), r2=87(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 23
LDI r2, 87
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
