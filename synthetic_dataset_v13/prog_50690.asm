; DESCRIPTION: Renders a magenta line between points (241, 206) and (65, 199).
; PLAN: r0=241(x1), r1=206(y1), r2=65(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 206
LDI r2, 65
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
