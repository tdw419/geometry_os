; DESCRIPTION: Renders a red line between points (154, 140) and (33, 82).
; PLAN: r0=154(x1), r1=140(y1), r2=33(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 140
LDI r2, 33
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
