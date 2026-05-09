; DESCRIPTION: Draws a blue line from (152, 77) to (114, 9).
; PLAN: r0=152(x1), r1=77(y1), r2=114(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 77
LDI r2, 114
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
