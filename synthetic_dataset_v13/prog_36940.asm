; DESCRIPTION: Renders a magenta line between points (255, 40) and (137, 134).
; PLAN: r0=255(x1), r1=40(y1), r2=137(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 40
LDI r2, 137
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
