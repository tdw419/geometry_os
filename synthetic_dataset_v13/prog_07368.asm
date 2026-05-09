; DESCRIPTION: Renders a red line between points (90, 41) and (260, 228).
; PLAN: r0=90(x1), r1=41(y1), r2=260(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 41
LDI r2, 260
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
