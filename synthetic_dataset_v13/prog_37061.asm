; DESCRIPTION: Renders a red line between points (84, 168) and (215, 58).
; PLAN: r0=84(x1), r1=168(y1), r2=215(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 168
LDI r2, 215
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
