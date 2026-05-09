; DESCRIPTION: Renders a magenta line between points (357, 215) and (103, 176).
; PLAN: r0=357(x1), r1=215(y1), r2=103(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 215
LDI r2, 103
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
