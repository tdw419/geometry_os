; DESCRIPTION: Renders a magenta line between points (49, 138) and (108, 107).
; PLAN: r0=49(x1), r1=138(y1), r2=108(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 138
LDI r2, 108
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
