; DESCRIPTION: Renders a magenta line between points (255, 8) and (339, 159).
; PLAN: r0=255(x1), r1=8(y1), r2=339(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 8
LDI r2, 339
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
