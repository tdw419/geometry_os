; DESCRIPTION: Composite: Sets a single purple pixel at (273, 171) then Places a red circle of radius 16 at center (261, 238) then Draws a purple rectangle at (80, 31) with width 85 and height 60.
; PLAN: r0=273(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=238(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=31(y), r12=85(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 171
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 238
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 31
LDI r12, 85
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
