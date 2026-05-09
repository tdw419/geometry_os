; DESCRIPTION: Draws a yellow line from (60, 25) to (506, 81).
; PLAN: r0=60(x1), r1=25(y1), r2=506(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 25
LDI r2, 506
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
