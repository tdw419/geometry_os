; DESCRIPTION: Draws a black line from (431, 200) to (266, 27).
; PLAN: r0=431(x1), r1=200(y1), r2=266(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 200
LDI r2, 266
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
