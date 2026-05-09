; DESCRIPTION: Draws a black line from (416, 189) to (18, 46).
; PLAN: r0=416(x1), r1=189(y1), r2=18(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 189
LDI r2, 18
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
