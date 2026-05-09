; DESCRIPTION: Composite: Creates a red rectangular region at (135, 13) spanning 11 by 85 pixels then Places a cyan circle of radius 34 at center (298, 92) then Sets a single cyan pixel at (3, 122).
; PLAN: r0=135(x), r1=13(y), r2=11(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=92(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x), r11=122(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 13
LDI r2, 11
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 92
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 122
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
