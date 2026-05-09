; DESCRIPTION: Renders a magenta line between points (54, 203) and (498, 27).
; PLAN: r0=54(x1), r1=203(y1), r2=498(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 203
LDI r2, 498
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
