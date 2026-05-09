; DESCRIPTION: Renders a black line between points (445, 9) and (135, 217).
; PLAN: r0=445(x1), r1=9(y1), r2=135(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 9
LDI r2, 135
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
