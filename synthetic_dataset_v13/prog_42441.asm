; DESCRIPTION: Renders a red line between points (64, 216) and (371, 61).
; PLAN: r0=64(x1), r1=216(y1), r2=371(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 216
LDI r2, 371
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
