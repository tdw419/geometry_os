; DESCRIPTION: Renders a black line between points (299, 246) and (50, 26).
; PLAN: r0=299(x1), r1=246(y1), r2=50(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 246
LDI r2, 50
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
