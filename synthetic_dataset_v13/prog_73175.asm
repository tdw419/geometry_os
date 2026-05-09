; DESCRIPTION: Renders a red line between points (443, 7) and (304, 166).
; PLAN: r0=443(x1), r1=7(y1), r2=304(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 7
LDI r2, 304
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
