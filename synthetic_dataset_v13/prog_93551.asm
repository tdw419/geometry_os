; DESCRIPTION: Composite: Creates a red rectangular region at (103, 20) spanning 115 by 17 pixels then Renders a purple disk with center (111, 78) and radius 45 then Places a blue dot at position (40, 96).
; PLAN: r0=103(x), r1=20(y), r2=115(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=78(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=96(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 103
LDI r1, 20
LDI r2, 115
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 78
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 96
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
