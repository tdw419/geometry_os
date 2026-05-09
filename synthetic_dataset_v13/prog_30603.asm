; DESCRIPTION: Renders a red line between points (8, 150) and (29, 14).
; PLAN: r0=8(x1), r1=150(y1), r2=29(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 150
LDI r2, 29
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
