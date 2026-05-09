; DESCRIPTION: Draws a black line from (17, 184) to (305, 205).
; PLAN: r0=17(x1), r1=184(y1), r2=305(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 184
LDI r2, 305
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
