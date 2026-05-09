; DESCRIPTION: Renders a red line between points (488, 229) and (288, 163).
; PLAN: r0=488(x1), r1=229(y1), r2=288(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 229
LDI r2, 288
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
