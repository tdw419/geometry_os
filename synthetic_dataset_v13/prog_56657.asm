; DESCRIPTION: Draws a green line from (36, 49) to (61, 112).
; PLAN: r0=36(x1), r1=49(y1), r2=61(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 49
LDI r2, 61
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
