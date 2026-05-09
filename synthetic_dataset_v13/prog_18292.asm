; DESCRIPTION: Renders a red line between points (385, 193) and (455, 62).
; PLAN: r0=385(x1), r1=193(y1), r2=455(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 193
LDI r2, 455
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
