; DESCRIPTION: Renders a red line between points (281, 47) and (43, 194).
; PLAN: r0=281(x1), r1=47(y1), r2=43(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 47
LDI r2, 43
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
