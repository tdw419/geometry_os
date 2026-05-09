; DESCRIPTION: Renders a blue line between points (66, 180) and (247, 33).
; PLAN: r0=66(x1), r1=180(y1), r2=247(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 180
LDI r2, 247
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
