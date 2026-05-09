; DESCRIPTION: Renders a red line between points (228, 206) and (34, 11).
; PLAN: r0=228(x1), r1=206(y1), r2=34(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 206
LDI r2, 34
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
