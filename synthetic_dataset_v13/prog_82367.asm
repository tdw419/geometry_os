; DESCRIPTION: Renders a blue line between points (428, 223) and (373, 13).
; PLAN: r0=428(x1), r1=223(y1), r2=373(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 223
LDI r2, 373
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
