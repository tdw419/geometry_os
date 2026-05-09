; DESCRIPTION: Renders a magenta line between points (436, 186) and (66, 125).
; PLAN: r0=436(x1), r1=186(y1), r2=66(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 186
LDI r2, 66
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
