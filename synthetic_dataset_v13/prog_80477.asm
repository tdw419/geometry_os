; DESCRIPTION: Renders a red line between points (256, 36) and (470, 158).
; PLAN: r0=256(x1), r1=36(y1), r2=470(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 36
LDI r2, 470
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
