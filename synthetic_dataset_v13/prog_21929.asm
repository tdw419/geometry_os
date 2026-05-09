; DESCRIPTION: Draws a black line from (310, 47) to (103, 54).
; PLAN: r0=310(x1), r1=47(y1), r2=103(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 47
LDI r2, 103
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
