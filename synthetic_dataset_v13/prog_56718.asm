; DESCRIPTION: Renders a black line between points (415, 230) and (99, 97).
; PLAN: r0=415(x1), r1=230(y1), r2=99(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 230
LDI r2, 99
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
