; DESCRIPTION: Renders a red line between points (304, 87) and (504, 237).
; PLAN: r0=304(x1), r1=87(y1), r2=504(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 87
LDI r2, 504
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
