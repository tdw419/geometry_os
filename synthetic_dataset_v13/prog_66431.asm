; DESCRIPTION: Draws a white line from (24, 142) to (132, 54).
; PLAN: r0=24(x1), r1=142(y1), r2=132(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 142
LDI r2, 132
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
