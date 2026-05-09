; DESCRIPTION: Renders a magenta line between points (269, 156) and (231, 196).
; PLAN: r0=269(x1), r1=156(y1), r2=231(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 156
LDI r2, 231
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
