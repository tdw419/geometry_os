; DESCRIPTION: Renders a blue line between points (247, 234) and (488, 156).
; PLAN: r0=247(x1), r1=234(y1), r2=488(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 234
LDI r2, 488
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
