; DESCRIPTION: Draws a yellow line from (84, 9) to (112, 228).
; PLAN: r0=84(x1), r1=9(y1), r2=112(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 9
LDI r2, 112
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
