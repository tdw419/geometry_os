; DESCRIPTION: Renders a magenta line between points (126, 142) and (332, 164).
; PLAN: r0=126(x1), r1=142(y1), r2=332(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 142
LDI r2, 332
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
