; DESCRIPTION: Renders a magenta line between points (91, 76) and (495, 192).
; PLAN: r0=91(x1), r1=76(y1), r2=495(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 76
LDI r2, 495
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
