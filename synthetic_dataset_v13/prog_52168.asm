; DESCRIPTION: Renders a magenta line between points (198, 54) and (64, 87).
; PLAN: r0=198(x1), r1=54(y1), r2=64(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 54
LDI r2, 64
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
