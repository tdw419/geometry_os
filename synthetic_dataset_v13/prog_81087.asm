; DESCRIPTION: Renders a blue line between points (182, 44) and (237, 150).
; PLAN: r0=182(x1), r1=44(y1), r2=237(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 44
LDI r2, 237
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
