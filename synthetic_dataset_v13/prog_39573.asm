; DESCRIPTION: Renders a magenta line between points (373, 103) and (444, 101).
; PLAN: r0=373(x1), r1=103(y1), r2=444(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 103
LDI r2, 444
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
