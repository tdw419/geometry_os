; DESCRIPTION: Renders a magenta line between points (23, 180) and (260, 134).
; PLAN: r0=23(x1), r1=180(y1), r2=260(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 180
LDI r2, 260
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
