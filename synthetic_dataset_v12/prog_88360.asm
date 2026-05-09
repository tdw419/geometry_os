; DESCRIPTION: Renders a red line between points (249, 57) and (157, 202).
; PLAN: r0=249(x1), r1=57(y1), r2=157(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 57
LDI r2, 157
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
