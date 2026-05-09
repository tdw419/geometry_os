; DESCRIPTION: Renders a white line between points (222, 40) and (132, 7).
; PLAN: r0=222(x1), r1=40(y1), r2=132(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 40
LDI r2, 132
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
