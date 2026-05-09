; DESCRIPTION: Composite: Creates a white rectangular region at (130, 29) spanning 18 by 86 pixels then Renders a purple disk with center (216, 132) and radius 72 then Sets a single red pixel at (471, 180).
; PLAN: r0=130(x), r1=29(y), r2=18(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=132(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=180(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 29
LDI r2, 18
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 132
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 180
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
