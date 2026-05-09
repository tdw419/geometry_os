; DESCRIPTION: Renders a purple line between points (406, 195) and (347, 55).
; PLAN: r0=406(x1), r1=195(y1), r2=347(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 195
LDI r2, 347
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
