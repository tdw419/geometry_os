; DESCRIPTION: Draws a magenta line from (189, 121) to (171, 147).
; PLAN: r0=189(x1), r1=121(y1), r2=171(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 121
LDI r2, 171
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
