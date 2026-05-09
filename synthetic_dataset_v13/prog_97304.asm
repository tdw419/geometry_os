; DESCRIPTION: Draws a yellow line from (145, 55) to (196, 221).
; PLAN: r0=145(x1), r1=55(y1), r2=196(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 55
LDI r2, 196
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
