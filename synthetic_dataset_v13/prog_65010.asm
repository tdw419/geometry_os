; DESCRIPTION: Renders a magenta line between points (459, 153) and (420, 181).
; PLAN: r0=459(x1), r1=153(y1), r2=420(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 153
LDI r2, 420
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
