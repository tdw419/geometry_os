; DESCRIPTION: Renders a yellow line between points (313, 92) and (440, 246).
; PLAN: r0=313(x1), r1=92(y1), r2=440(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 92
LDI r2, 440
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
