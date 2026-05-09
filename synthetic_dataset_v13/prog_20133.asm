; DESCRIPTION: Renders a yellow line between points (105, 247) and (255, 218).
; PLAN: r0=105(x1), r1=247(y1), r2=255(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 247
LDI r2, 255
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
