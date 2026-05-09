; DESCRIPTION: Renders a magenta line between points (162, 113) and (92, 8).
; PLAN: r0=162(x1), r1=113(y1), r2=92(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 113
LDI r2, 92
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
