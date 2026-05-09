; DESCRIPTION: Composite: Renders a purple box of size 75x67 starting at (309, 58) then Renders a black disk with center (295, 142) and radius 41 then Renders a red line between points (103, 38) and (334, 199).
; PLAN: r0=309(x), r1=58(y), r2=75(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=142(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x1), r11=38(y1), r12=334(x2), r13=199(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 58
LDI r2, 75
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 142
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 38
LDI r12, 334
LDI r13, 199
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
