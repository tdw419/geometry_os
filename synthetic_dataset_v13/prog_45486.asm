; DESCRIPTION: Renders a cyan line between points (416, 21) and (119, 109).
; PLAN: r0=416(x1), r1=21(y1), r2=119(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 21
LDI r2, 119
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
