; DESCRIPTION: Composite: Creates a white circular shape at (108, 78) with radius 62 then Places a blue line segment connecting (304, 121) to (328, 182) then Sets a single black pixel at (215, 73).
; PLAN: r0=108(x), r1=78(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=121(y1), r7=328(x2), r8=182(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=73(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 78
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 121
LDI r7, 328
LDI r8, 182
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 73
LDI r12, 0x000000
PSET r10, r11, r12
HALT
