; DESCRIPTION: Renders a magenta line between points (508, 213) and (63, 170).
; PLAN: r0=508(x1), r1=213(y1), r2=63(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 213
LDI r2, 63
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
