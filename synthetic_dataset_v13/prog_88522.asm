; DESCRIPTION: Renders a magenta line between points (238, 222) and (152, 94).
; PLAN: r0=238(x1), r1=222(y1), r2=152(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 222
LDI r2, 152
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
