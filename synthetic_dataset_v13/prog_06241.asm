; DESCRIPTION: Renders a yellow line between points (71, 135) and (238, 103).
; PLAN: r0=71(x1), r1=135(y1), r2=238(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 135
LDI r2, 238
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
