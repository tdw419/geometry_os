; DESCRIPTION: Renders a white line between points (162, 55) and (469, 198).
; PLAN: r0=162(x1), r1=55(y1), r2=469(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 55
LDI r2, 469
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
