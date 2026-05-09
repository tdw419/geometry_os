; DESCRIPTION: Renders a magenta line between points (19, 60) and (211, 164).
; PLAN: r0=19(x1), r1=60(y1), r2=211(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 60
LDI r2, 211
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
