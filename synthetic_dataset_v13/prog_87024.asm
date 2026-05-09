; DESCRIPTION: Composite: Creates a purple circular shape at (427, 121) with radius 28 then Places a purple dot at position (379, 70) then Renders a cyan line between points (68, 123) and (333, 226).
; PLAN: r0=427(x), r1=121(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=70(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=68(x1), r11=123(y1), r12=333(x2), r13=226(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 121
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 70
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 123
LDI r12, 333
LDI r13, 226
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
