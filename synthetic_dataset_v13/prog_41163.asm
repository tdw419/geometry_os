; DESCRIPTION: Renders a magenta line between points (126, 161) and (384, 127).
; PLAN: r0=126(x1), r1=161(y1), r2=384(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 161
LDI r2, 384
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
