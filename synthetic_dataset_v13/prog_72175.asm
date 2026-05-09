; DESCRIPTION: Renders a magenta line between points (488, 180) and (306, 93).
; PLAN: r0=488(x1), r1=180(y1), r2=306(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 180
LDI r2, 306
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
