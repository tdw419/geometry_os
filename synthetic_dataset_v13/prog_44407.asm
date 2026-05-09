; DESCRIPTION: Renders a magenta line between points (472, 67) and (273, 113).
; PLAN: r0=472(x1), r1=67(y1), r2=273(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 67
LDI r2, 273
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
