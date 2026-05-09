; DESCRIPTION: Renders a black line between points (90, 115) and (344, 19).
; PLAN: r0=90(x1), r1=115(y1), r2=344(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 115
LDI r2, 344
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
