; DESCRIPTION: Renders a black line between points (23, 97) and (465, 35).
; PLAN: r0=23(x1), r1=97(y1), r2=465(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 97
LDI r2, 465
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
