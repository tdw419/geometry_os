; DESCRIPTION: Renders a yellow line between points (455, 177) and (378, 210).
; PLAN: r0=455(x1), r1=177(y1), r2=378(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 177
LDI r2, 378
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
