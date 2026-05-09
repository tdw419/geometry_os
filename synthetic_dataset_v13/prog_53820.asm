; DESCRIPTION: Renders a white line between points (428, 105) and (127, 183).
; PLAN: r0=428(x1), r1=105(y1), r2=127(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 105
LDI r2, 127
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
