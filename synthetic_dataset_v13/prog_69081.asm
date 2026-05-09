; DESCRIPTION: Composite: Places a black line segment connecting (124, 184) to (95, 124) then Places a green circle of radius 14 at center (412, 120) then Places a cyan dot at position (503, 68).
; PLAN: r0=124(x1), r1=184(y1), r2=95(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=120(y), r7=14(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x), r11=68(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 184
LDI r2, 95
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 120
LDI r7, 14
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 68
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
