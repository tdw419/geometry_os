; DESCRIPTION: Renders a magenta line between points (415, 76) and (127, 162).
; PLAN: r0=415(x1), r1=76(y1), r2=127(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 76
LDI r2, 127
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
