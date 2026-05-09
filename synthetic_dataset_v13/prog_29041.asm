; DESCRIPTION: Renders a yellow line between points (100, 30) and (39, 173).
; PLAN: r0=100(x1), r1=30(y1), r2=39(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 30
LDI r2, 39
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
