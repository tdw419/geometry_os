; DESCRIPTION: Draws a green line from (112, 34) to (196, 59).
; PLAN: r0=112(x1), r1=34(y1), r2=196(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 34
LDI r2, 196
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
