; DESCRIPTION: Renders a magenta line between points (441, 17) and (186, 113).
; PLAN: r0=441(x1), r1=17(y1), r2=186(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 17
LDI r2, 186
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
