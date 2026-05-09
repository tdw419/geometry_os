; DESCRIPTION: Renders a magenta line between points (495, 195) and (310, 156).
; PLAN: r0=495(x1), r1=195(y1), r2=310(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 195
LDI r2, 310
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
