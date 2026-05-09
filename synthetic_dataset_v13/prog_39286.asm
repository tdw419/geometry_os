; DESCRIPTION: Draws a white line from (25, 2) to (87, 90).
; PLAN: r0=25(x1), r1=2(y1), r2=87(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 2
LDI r2, 87
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
