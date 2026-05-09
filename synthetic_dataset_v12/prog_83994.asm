; DESCRIPTION: Renders a black line between points (186, 42) and (158, 184).
; PLAN: r0=186(x1), r1=42(y1), r2=158(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 42
LDI r2, 158
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
