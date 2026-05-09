; DESCRIPTION: Renders a magenta line between points (137, 19) and (416, 246).
; PLAN: r0=137(x1), r1=19(y1), r2=416(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 19
LDI r2, 416
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
