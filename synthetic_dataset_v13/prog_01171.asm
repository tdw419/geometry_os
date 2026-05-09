; DESCRIPTION: Composite: Creates a white rectangular region at (193, 94) spanning 16 by 78 pixels then Renders a purple disk with center (58, 66) and radius 54 then Places a red dot at position (22, 238).
; PLAN: r0=193(x), r1=94(y), r2=16(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=66(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=238(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 94
LDI r2, 16
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 66
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 238
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
