; DESCRIPTION: Renders a magenta line between points (298, 123) and (466, 180).
; PLAN: r0=298(x1), r1=123(y1), r2=466(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 123
LDI r2, 466
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
