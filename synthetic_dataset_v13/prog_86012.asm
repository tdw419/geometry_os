; DESCRIPTION: Draws a yellow line from (425, 51) to (184, 47).
; PLAN: r0=425(x1), r1=51(y1), r2=184(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 51
LDI r2, 184
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
