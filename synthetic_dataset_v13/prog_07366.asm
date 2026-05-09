; DESCRIPTION: Composite: Renders a blue line between points (347, 142) and (17, 93) then Places a green 83x79 rectangle at position (135, 100).
; PLAN: r0=347(x1), r1=142(y1), r2=17(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=100(y), r7=83(width), r8=79(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 142
LDI r2, 17
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 100
LDI r7, 83
LDI r8, 79
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
