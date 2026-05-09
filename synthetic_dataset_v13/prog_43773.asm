; DESCRIPTION: Renders a yellow line between points (308, 116) and (252, 57).
; PLAN: r0=308(x1), r1=116(y1), r2=252(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 116
LDI r2, 252
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
