; DESCRIPTION: Renders a magenta line between points (59, 185) and (288, 125).
; PLAN: r0=59(x1), r1=185(y1), r2=288(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 185
LDI r2, 288
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
