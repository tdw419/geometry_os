; DESCRIPTION: Renders a magenta line between points (240, 111) and (8, 68).
; PLAN: r0=240(x1), r1=111(y1), r2=8(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 111
LDI r2, 8
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
