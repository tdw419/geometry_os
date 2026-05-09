; DESCRIPTION: Renders a magenta line between points (488, 28) and (40, 19).
; PLAN: r0=488(x1), r1=28(y1), r2=40(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 28
LDI r2, 40
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
