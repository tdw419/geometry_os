; DESCRIPTION: Draws a black line from (370, 248) to (313, 76).
; PLAN: r0=370(x1), r1=248(y1), r2=313(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 248
LDI r2, 313
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
