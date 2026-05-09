; DESCRIPTION: Draws a magenta line from (239, 147) to (131, 115).
; PLAN: r0=239(x1), r1=147(y1), r2=131(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 147
LDI r2, 131
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
