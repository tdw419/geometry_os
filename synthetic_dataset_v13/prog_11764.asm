; DESCRIPTION: Renders a magenta line between points (283, 147) and (165, 209).
; PLAN: r0=283(x1), r1=147(y1), r2=165(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 147
LDI r2, 165
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
