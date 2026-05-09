; DESCRIPTION: Composite: Creates a blue rectangular region at (486, 54) spanning 21 by 48 pixels then Sets a single red pixel at (2, 104) then Renders a cyan disk with center (358, 158) and radius 24.
; PLAN: r0=486(x), r1=54(y), r2=21(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=358(x), r11=158(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 54
LDI r2, 21
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 358
LDI r11, 158
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
