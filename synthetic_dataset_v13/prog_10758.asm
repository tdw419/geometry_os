; DESCRIPTION: Renders a magenta line between points (168, 15) and (316, 52).
; PLAN: r0=168(x1), r1=15(y1), r2=316(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 15
LDI r2, 316
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
