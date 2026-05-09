; DESCRIPTION: Draws a yellow line from (333, 112) to (199, 121).
; PLAN: r0=333(x1), r1=112(y1), r2=199(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 112
LDI r2, 199
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
