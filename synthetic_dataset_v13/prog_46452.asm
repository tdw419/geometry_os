; DESCRIPTION: Renders a red line between points (487, 223) and (149, 148).
; PLAN: r0=487(x1), r1=223(y1), r2=149(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 223
LDI r2, 149
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
