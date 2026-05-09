; DESCRIPTION: Renders a magenta line between points (285, 96) and (505, 0).
; PLAN: r0=285(x1), r1=96(y1), r2=505(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 96
LDI r2, 505
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
