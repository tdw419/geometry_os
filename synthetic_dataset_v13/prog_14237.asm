; DESCRIPTION: Renders a magenta line between points (184, 152) and (59, 227).
; PLAN: r0=184(x1), r1=152(y1), r2=59(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 152
LDI r2, 59
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
