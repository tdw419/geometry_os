; DESCRIPTION: Renders a red line between points (495, 138) and (403, 243).
; PLAN: r0=495(x1), r1=138(y1), r2=403(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 138
LDI r2, 403
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
