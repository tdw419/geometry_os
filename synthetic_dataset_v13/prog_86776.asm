; DESCRIPTION: Renders a magenta line between points (345, 229) and (156, 192).
; PLAN: r0=345(x1), r1=229(y1), r2=156(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 229
LDI r2, 156
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
