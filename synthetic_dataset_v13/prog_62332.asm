; DESCRIPTION: Draws a black line from (161, 83) to (103, 33).
; PLAN: r0=161(x1), r1=83(y1), r2=103(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 83
LDI r2, 103
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
