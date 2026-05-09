; DESCRIPTION: Renders a red line between points (196, 171) and (176, 47).
; PLAN: r0=196(x1), r1=171(y1), r2=176(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 171
LDI r2, 176
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
