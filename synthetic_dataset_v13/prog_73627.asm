; DESCRIPTION: Draws a blue line from (0, 31) to (439, 75).
; PLAN: r0=0(x1), r1=31(y1), r2=439(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 31
LDI r2, 439
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
