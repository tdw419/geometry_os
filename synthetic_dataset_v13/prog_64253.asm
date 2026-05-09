; DESCRIPTION: Renders a red line between points (384, 50) and (20, 101).
; PLAN: r0=384(x1), r1=50(y1), r2=20(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 50
LDI r2, 20
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
