; DESCRIPTION: Composite: Draws a cyan circle centered at (150, 78) with radius 45 then Sets a single yellow pixel at (157, 116) then Places a purple line segment connecting (262, 141) to (456, 154).
; PLAN: r0=150(x), r1=78(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=262(x1), r11=141(y1), r12=456(x2), r13=154(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 78
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 262
LDI r11, 141
LDI r12, 456
LDI r13, 154
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
