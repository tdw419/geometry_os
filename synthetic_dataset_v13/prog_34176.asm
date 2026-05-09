; DESCRIPTION: Composite: Renders a black line between points (76, 43) and (474, 33) then Places a purple 55x106 rectangle at position (200, 64).
; PLAN: r0=76(x1), r1=43(y1), r2=474(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=64(y), r7=55(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 43
LDI r2, 474
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 64
LDI r7, 55
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
