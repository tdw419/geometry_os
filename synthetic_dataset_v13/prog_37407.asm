; DESCRIPTION: Draws a white line from (239, 122) to (129, 110).
; PLAN: r0=239(x1), r1=122(y1), r2=129(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 122
LDI r2, 129
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
