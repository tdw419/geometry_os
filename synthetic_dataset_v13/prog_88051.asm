; DESCRIPTION: Composite: Sets a single red pixel at (383, 128) then Draws a white circle centered at (346, 110) with radius 18 then Creates a purple rectangular region at (374, 93) spanning 20 by 15 pixels.
; PLAN: r0=383(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=110(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=93(y), r12=20(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 110
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 93
LDI r12, 20
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
