; DESCRIPTION: Renders a magenta line between points (198, 66) and (28, 34).
; PLAN: r0=198(x1), r1=66(y1), r2=28(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 66
LDI r2, 28
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
