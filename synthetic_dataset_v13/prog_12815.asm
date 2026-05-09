; DESCRIPTION: Renders a red line between points (301, 221) and (499, 21).
; PLAN: r0=301(x1), r1=221(y1), r2=499(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 221
LDI r2, 499
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
