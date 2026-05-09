; DESCRIPTION: Renders a magenta line between points (389, 76) and (340, 125).
; PLAN: r0=389(x1), r1=76(y1), r2=340(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 76
LDI r2, 340
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
