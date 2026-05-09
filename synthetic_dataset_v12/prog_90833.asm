; DESCRIPTION: Renders a blue line between points (71, 236) and (53, 249).
; PLAN: r0=71(x1), r1=236(y1), r2=53(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 236
LDI r2, 53
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
