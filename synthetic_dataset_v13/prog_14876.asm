; DESCRIPTION: Renders a purple line between points (62, 42) and (504, 192).
; PLAN: r0=62(x1), r1=42(y1), r2=504(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 42
LDI r2, 504
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
