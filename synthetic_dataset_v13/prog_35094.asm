; DESCRIPTION: Renders a magenta line between points (97, 223) and (73, 209).
; PLAN: r0=97(x1), r1=223(y1), r2=73(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 223
LDI r2, 73
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
