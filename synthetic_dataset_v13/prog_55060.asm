; DESCRIPTION: Renders a magenta line between points (290, 107) and (444, 163).
; PLAN: r0=290(x1), r1=107(y1), r2=444(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 107
LDI r2, 444
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
