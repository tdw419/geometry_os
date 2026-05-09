; DESCRIPTION: Composite: Places a cyan line segment connecting (387, 32) to (67, 158) then Draws a green circle centered at (135, 80) with radius 38 then Sets a single green pixel at (273, 58).
; PLAN: r0=387(x1), r1=32(y1), r2=67(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=80(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=58(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 32
LDI r2, 67
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 80
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 58
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
