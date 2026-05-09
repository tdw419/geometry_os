; DESCRIPTION: Renders a black line between points (70, 221) and (246, 25).
; PLAN: r0=70(x1), r1=221(y1), r2=246(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 221
LDI r2, 246
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
