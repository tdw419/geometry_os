; DESCRIPTION: Renders a magenta line between points (457, 20) and (327, 36).
; PLAN: r0=457(x1), r1=20(y1), r2=327(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 20
LDI r2, 327
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
