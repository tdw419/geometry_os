; DESCRIPTION: Renders a magenta line between points (171, 23) and (2, 161).
; PLAN: r0=171(x1), r1=23(y1), r2=2(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 23
LDI r2, 2
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
