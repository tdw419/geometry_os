; DESCRIPTION: Renders a magenta line between points (415, 118) and (485, 187).
; PLAN: r0=415(x1), r1=118(y1), r2=485(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 118
LDI r2, 485
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
