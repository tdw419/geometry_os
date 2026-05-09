; DESCRIPTION: Renders a magenta line between points (23, 73) and (77, 60).
; PLAN: r0=23(x1), r1=73(y1), r2=77(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 73
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
