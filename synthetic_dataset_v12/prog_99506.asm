; DESCRIPTION: Places a yellow line segment connecting (428, 115) to (217, 46).
; PLAN: r0=428(x1), r1=115(y1), r2=217(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 115
LDI r2, 217
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
