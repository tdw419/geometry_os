; DESCRIPTION: Renders a magenta line between points (328, 222) and (453, 171).
; PLAN: r0=328(x1), r1=222(y1), r2=453(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 222
LDI r2, 453
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
