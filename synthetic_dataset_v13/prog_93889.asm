; DESCRIPTION: Draws a yellow line from (504, 144) to (134, 124).
; PLAN: r0=504(x1), r1=144(y1), r2=134(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 144
LDI r2, 134
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
