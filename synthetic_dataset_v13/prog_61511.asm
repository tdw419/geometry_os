; DESCRIPTION: Renders a green line between points (264, 43) and (360, 82).
; PLAN: r0=264(x1), r1=43(y1), r2=360(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 43
LDI r2, 360
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
