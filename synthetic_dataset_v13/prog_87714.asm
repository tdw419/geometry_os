; DESCRIPTION: Renders a magenta line between points (223, 28) and (282, 204).
; PLAN: r0=223(x1), r1=28(y1), r2=282(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 28
LDI r2, 282
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
