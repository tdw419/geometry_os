; DESCRIPTION: Renders a magenta line between points (157, 175) and (130, 103).
; PLAN: r0=157(x1), r1=175(y1), r2=130(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 175
LDI r2, 130
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
