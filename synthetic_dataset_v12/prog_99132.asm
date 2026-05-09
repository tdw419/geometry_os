; DESCRIPTION: Renders a white line between points (392, 158) and (313, 2).
; PLAN: r0=392(x1), r1=158(y1), r2=313(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 158
LDI r2, 313
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
