; DESCRIPTION: Renders a magenta line between points (27, 113) and (32, 78).
; PLAN: r0=27(x1), r1=113(y1), r2=32(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 113
LDI r2, 32
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
