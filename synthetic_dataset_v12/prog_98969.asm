; DESCRIPTION: Renders a yellow line between points (14, 87) and (255, 54).
; PLAN: r0=14(x1), r1=87(y1), r2=255(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 87
LDI r2, 255
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
