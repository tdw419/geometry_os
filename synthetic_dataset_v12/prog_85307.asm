; DESCRIPTION: Renders a red line between points (215, 59) and (78, 60).
; PLAN: r0=215(x1), r1=59(y1), r2=78(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 78
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
