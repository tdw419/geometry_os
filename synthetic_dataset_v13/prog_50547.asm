; DESCRIPTION: Draws a white line from (278, 200) to (431, 76).
; PLAN: r0=278(x1), r1=200(y1), r2=431(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 200
LDI r2, 431
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
