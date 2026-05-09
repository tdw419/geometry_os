; DESCRIPTION: Renders a blue line between points (141, 111) and (214, 39).
; PLAN: r0=141(x1), r1=111(y1), r2=214(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 111
LDI r2, 214
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
