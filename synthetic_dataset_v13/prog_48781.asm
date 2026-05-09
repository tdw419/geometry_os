; DESCRIPTION: Renders a magenta line between points (415, 25) and (225, 191).
; PLAN: r0=415(x1), r1=25(y1), r2=225(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 25
LDI r2, 225
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
