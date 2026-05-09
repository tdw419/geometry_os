; DESCRIPTION: Renders a yellow line between points (313, 193) and (424, 177).
; PLAN: r0=313(x1), r1=193(y1), r2=424(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 193
LDI r2, 424
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
