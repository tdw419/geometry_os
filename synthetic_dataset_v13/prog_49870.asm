; DESCRIPTION: Composite: Renders a purple disk with center (93, 129) and radius 54 then Creates a green rectangular region at (48, 31) spanning 40 by 72 pixels then Places a purple dot at position (126, 74).
; PLAN: r0=93(x), r1=129(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=31(y), r7=40(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x), r11=74(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 129
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 31
LDI r7, 40
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 74
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
