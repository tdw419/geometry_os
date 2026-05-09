; DESCRIPTION: Renders a orange line between points (279, 115) and (313, 198).
; PLAN: r0=279(x1), r1=115(y1), r2=313(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 115
LDI r2, 313
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
