; DESCRIPTION: Renders a red line between points (0, 223) and (454, 60).
; PLAN: r0=0(x1), r1=223(y1), r2=454(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 223
LDI r2, 454
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
