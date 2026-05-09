; DESCRIPTION: Renders a magenta line between points (47, 138) and (239, 0).
; PLAN: r0=47(x1), r1=138(y1), r2=239(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 138
LDI r2, 239
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
