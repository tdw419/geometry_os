; DESCRIPTION: Renders a blue line between points (352, 114) and (418, 170).
; PLAN: r0=352(x1), r1=114(y1), r2=418(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 114
LDI r2, 418
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
