; DESCRIPTION: Renders a magenta line between points (494, 171) and (150, 180).
; PLAN: r0=494(x1), r1=171(y1), r2=150(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 171
LDI r2, 150
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
