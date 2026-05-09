; DESCRIPTION: Renders a magenta line between points (455, 36) and (374, 75).
; PLAN: r0=455(x1), r1=36(y1), r2=374(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 36
LDI r2, 374
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
