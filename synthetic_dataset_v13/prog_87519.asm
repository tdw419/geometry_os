; DESCRIPTION: Renders a magenta line between points (396, 135) and (46, 202).
; PLAN: r0=396(x1), r1=135(y1), r2=46(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 135
LDI r2, 46
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
