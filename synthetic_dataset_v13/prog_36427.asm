; DESCRIPTION: Renders a red line between points (403, 142) and (182, 28).
; PLAN: r0=403(x1), r1=142(y1), r2=182(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 142
LDI r2, 182
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
