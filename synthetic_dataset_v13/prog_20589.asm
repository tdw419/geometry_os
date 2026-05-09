; DESCRIPTION: Renders a yellow line between points (466, 14) and (460, 171).
; PLAN: r0=466(x1), r1=14(y1), r2=460(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 14
LDI r2, 460
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
