; DESCRIPTION: Renders a magenta line between points (488, 64) and (136, 53).
; PLAN: r0=488(x1), r1=64(y1), r2=136(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 64
LDI r2, 136
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
