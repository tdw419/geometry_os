; DESCRIPTION: Renders a magenta line between points (169, 143) and (23, 182).
; PLAN: r0=169(x1), r1=143(y1), r2=23(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 143
LDI r2, 23
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
