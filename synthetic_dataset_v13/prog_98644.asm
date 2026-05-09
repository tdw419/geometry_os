; DESCRIPTION: Composite: Renders a purple box of size 76x24 starting at (83, 86) then Places a red dot at position (402, 215) then Places a purple line segment connecting (478, 104) to (458, 59).
; PLAN: r0=83(x), r1=86(y), r2=76(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=215(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=478(x1), r11=104(y1), r12=458(x2), r13=59(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 86
LDI r2, 76
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 215
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 478
LDI r11, 104
LDI r12, 458
LDI r13, 59
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
