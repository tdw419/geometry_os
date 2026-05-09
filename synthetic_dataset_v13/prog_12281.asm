; DESCRIPTION: Draws a yellow line from (505, 202) to (421, 132).
; PLAN: r0=505(x1), r1=202(y1), r2=421(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 202
LDI r2, 421
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
