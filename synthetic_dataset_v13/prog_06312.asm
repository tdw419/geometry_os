; DESCRIPTION: Draws a yellow line from (63, 218) to (52, 124).
; PLAN: r0=63(x1), r1=218(y1), r2=52(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 218
LDI r2, 52
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
