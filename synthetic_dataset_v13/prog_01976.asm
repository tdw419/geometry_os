; DESCRIPTION: Renders a blue line between points (187, 40) and (212, 102).
; PLAN: r0=187(x1), r1=40(y1), r2=212(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 40
LDI r2, 212
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
