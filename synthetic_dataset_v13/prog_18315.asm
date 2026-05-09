; DESCRIPTION: Draws a yellow line from (40, 48) to (19, 196).
; PLAN: r0=40(x1), r1=48(y1), r2=19(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 48
LDI r2, 19
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
