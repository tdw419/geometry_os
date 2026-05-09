; DESCRIPTION: Draws a black line from (236, 84) to (504, 226).
; PLAN: r0=236(x1), r1=84(y1), r2=504(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 84
LDI r2, 504
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
