; DESCRIPTION: Renders a magenta line between points (195, 13) and (362, 177).
; PLAN: r0=195(x1), r1=13(y1), r2=362(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 13
LDI r2, 362
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
