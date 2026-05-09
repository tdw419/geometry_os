; DESCRIPTION: Renders a red line between points (172, 72) and (197, 10).
; PLAN: r0=172(x1), r1=72(y1), r2=197(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 72
LDI r2, 197
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
