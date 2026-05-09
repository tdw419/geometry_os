; DESCRIPTION: Renders a yellow line between points (217, 255) and (442, 190).
; PLAN: r0=217(x1), r1=255(y1), r2=442(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 255
LDI r2, 442
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
