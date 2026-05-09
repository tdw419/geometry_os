; DESCRIPTION: Renders a blue line between points (197, 46) and (30, 214).
; PLAN: r0=197(x1), r1=46(y1), r2=30(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 46
LDI r2, 30
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
