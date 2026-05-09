; DESCRIPTION: Renders a magenta line between points (21, 142) and (457, 166).
; PLAN: r0=21(x1), r1=142(y1), r2=457(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 142
LDI r2, 457
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
