; DESCRIPTION: Renders a white line between points (428, 30) and (179, 127).
; PLAN: r0=428(x1), r1=30(y1), r2=179(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 30
LDI r2, 179
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
