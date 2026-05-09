; DESCRIPTION: Draws a yellow line from (504, 121) to (110, 79).
; PLAN: r0=504(x1), r1=121(y1), r2=110(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 121
LDI r2, 110
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
