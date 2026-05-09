; DESCRIPTION: Renders a red line between points (127, 153) and (503, 109).
; PLAN: r0=127(x1), r1=153(y1), r2=503(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 153
LDI r2, 503
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
