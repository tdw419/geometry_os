; DESCRIPTION: Draws a green line from (73, 7) to (112, 254).
; PLAN: r0=73(x1), r1=7(y1), r2=112(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 7
LDI r2, 112
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
