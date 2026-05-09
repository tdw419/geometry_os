; DESCRIPTION: Renders a red line between points (126, 160) and (299, 181).
; PLAN: r0=126(x1), r1=160(y1), r2=299(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 160
LDI r2, 299
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
