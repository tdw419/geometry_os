; DESCRIPTION: Renders a blue line between points (49, 40) and (380, 54).
; PLAN: r0=49(x1), r1=40(y1), r2=380(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 40
LDI r2, 380
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
