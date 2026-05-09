; DESCRIPTION: Renders a magenta line between points (263, 13) and (55, 0).
; PLAN: r0=263(x1), r1=13(y1), r2=55(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 13
LDI r2, 55
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
