; DESCRIPTION: Draws a white line from (439, 57) to (345, 105).
; PLAN: r0=439(x1), r1=57(y1), r2=345(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 57
LDI r2, 345
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
