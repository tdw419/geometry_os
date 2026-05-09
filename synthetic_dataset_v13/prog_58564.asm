; DESCRIPTION: Draws a white line from (254, 188) to (388, 54).
; PLAN: r0=254(x1), r1=188(y1), r2=388(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 188
LDI r2, 388
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
