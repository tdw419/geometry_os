; DESCRIPTION: Renders a red line between points (192, 27) and (256, 98).
; PLAN: r0=192(x1), r1=27(y1), r2=256(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 27
LDI r2, 256
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
