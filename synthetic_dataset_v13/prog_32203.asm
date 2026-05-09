; DESCRIPTION: Draws a yellow line from (86, 33) to (124, 115).
; PLAN: r0=86(x1), r1=33(y1), r2=124(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 33
LDI r2, 124
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
