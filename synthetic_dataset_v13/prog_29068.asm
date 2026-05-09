; DESCRIPTION: Renders a blue line between points (294, 154) and (71, 84).
; PLAN: r0=294(x1), r1=154(y1), r2=71(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 154
LDI r2, 71
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
