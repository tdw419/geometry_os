; DESCRIPTION: Renders a magenta line between points (244, 248) and (222, 171).
; PLAN: r0=244(x1), r1=248(y1), r2=222(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 248
LDI r2, 222
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
