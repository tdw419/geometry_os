; DESCRIPTION: Renders a red line between points (488, 181) and (511, 204).
; PLAN: r0=488(x1), r1=181(y1), r2=511(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 181
LDI r2, 511
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
