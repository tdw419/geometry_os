; DESCRIPTION: Renders a magenta line between points (243, 173) and (483, 18).
; PLAN: r0=243(x1), r1=173(y1), r2=483(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 173
LDI r2, 483
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
