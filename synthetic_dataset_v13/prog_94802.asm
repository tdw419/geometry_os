; DESCRIPTION: Renders a magenta line between points (197, 189) and (104, 56).
; PLAN: r0=197(x1), r1=189(y1), r2=104(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 189
LDI r2, 104
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
