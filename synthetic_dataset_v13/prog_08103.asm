; DESCRIPTION: Renders a white line between points (4, 198) and (121, 91).
; PLAN: r0=4(x1), r1=198(y1), r2=121(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 198
LDI r2, 121
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
