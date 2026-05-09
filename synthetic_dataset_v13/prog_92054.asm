; DESCRIPTION: Draws a yellow line from (506, 213) to (172, 90).
; PLAN: r0=506(x1), r1=213(y1), r2=172(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 213
LDI r2, 172
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
