; DESCRIPTION: Draws a yellow line from (168, 147) to (5, 89).
; PLAN: r0=168(x1), r1=147(y1), r2=5(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 147
LDI r2, 5
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
