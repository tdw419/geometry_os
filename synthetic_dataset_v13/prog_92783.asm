; DESCRIPTION: Draws a white line from (70, 170) to (219, 55).
; PLAN: r0=70(x1), r1=170(y1), r2=219(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 170
LDI r2, 219
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
