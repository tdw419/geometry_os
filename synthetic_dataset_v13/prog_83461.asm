; DESCRIPTION: Composite: Creates a white rectangular region at (95, 113) spanning 73 by 36 pixels then Places a red circle of radius 52 at center (157, 141) then Sets a single green pixel at (466, 187).
; PLAN: r0=95(x), r1=113(y), r2=73(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=141(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=466(x), r11=187(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 113
LDI r2, 73
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 141
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 466
LDI r11, 187
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
