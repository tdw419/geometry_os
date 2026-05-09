; DESCRIPTION: Renders a magenta line between points (454, 11) and (495, 210).
; PLAN: r0=454(x1), r1=11(y1), r2=495(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 11
LDI r2, 495
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
