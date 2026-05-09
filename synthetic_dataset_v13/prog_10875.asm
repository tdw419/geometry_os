; DESCRIPTION: Renders a red line between points (333, 212) and (424, 214).
; PLAN: r0=333(x1), r1=212(y1), r2=424(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 212
LDI r2, 424
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
