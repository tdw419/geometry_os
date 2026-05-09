; DESCRIPTION: Draws a white line from (85, 83) to (247, 83).
; PLAN: r0=85(x1), r1=83(y1), r2=247(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 83
LDI r2, 247
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
