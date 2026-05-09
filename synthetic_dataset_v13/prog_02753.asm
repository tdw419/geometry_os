; DESCRIPTION: Renders a magenta line between points (21, 126) and (82, 232).
; PLAN: r0=21(x1), r1=126(y1), r2=82(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 126
LDI r2, 82
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
