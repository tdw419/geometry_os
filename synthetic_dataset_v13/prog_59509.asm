; DESCRIPTION: Renders a blue line between points (386, 195) and (357, 33).
; PLAN: r0=386(x1), r1=195(y1), r2=357(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 195
LDI r2, 357
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
