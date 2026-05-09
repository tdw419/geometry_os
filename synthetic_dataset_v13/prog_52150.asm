; DESCRIPTION: Draws a yellow line from (491, 103) to (57, 205).
; PLAN: r0=491(x1), r1=103(y1), r2=57(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 103
LDI r2, 57
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
