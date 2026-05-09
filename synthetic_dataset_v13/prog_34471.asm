; DESCRIPTION: Draws a white line from (22, 90) to (424, 55).
; PLAN: r0=22(x1), r1=90(y1), r2=424(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 90
LDI r2, 424
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
