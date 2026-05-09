; DESCRIPTION: Renders a purple line between points (455, 65) and (58, 210).
; PLAN: r0=455(x1), r1=65(y1), r2=58(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 65
LDI r2, 58
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
