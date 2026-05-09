; DESCRIPTION: Renders a yellow line between points (415, 255) and (360, 191).
; PLAN: r0=415(x1), r1=255(y1), r2=360(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 255
LDI r2, 360
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
