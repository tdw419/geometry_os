; DESCRIPTION: Composite: Creates a white rectangular region at (377, 149) spanning 95 by 43 pixels then Sets a single purple pixel at (153, 92) then Places a cyan circle of radius 72 at center (200, 158).
; PLAN: r0=377(x), r1=149(y), r2=95(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=158(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 149
LDI r2, 95
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 200
LDI r11, 158
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
