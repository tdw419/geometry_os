; DESCRIPTION: Renders a magenta line between points (219, 49) and (406, 33).
; PLAN: r0=219(x1), r1=49(y1), r2=406(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 406
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
