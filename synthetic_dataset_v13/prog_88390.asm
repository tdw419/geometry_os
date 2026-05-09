; DESCRIPTION: Draws a black line from (107, 84) to (115, 59).
; PLAN: r0=107(x1), r1=84(y1), r2=115(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 84
LDI r2, 115
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
