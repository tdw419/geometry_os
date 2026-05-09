; DESCRIPTION: Renders a magenta line between points (221, 195) and (444, 160).
; PLAN: r0=221(x1), r1=195(y1), r2=444(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 195
LDI r2, 444
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
