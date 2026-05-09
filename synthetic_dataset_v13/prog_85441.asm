; DESCRIPTION: Draws a black line from (200, 52) to (205, 178).
; PLAN: r0=200(x1), r1=52(y1), r2=205(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 52
LDI r2, 205
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
