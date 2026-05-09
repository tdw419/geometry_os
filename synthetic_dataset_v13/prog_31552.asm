; DESCRIPTION: Composite: Creates a green rectangular region at (77, 5) spanning 40 by 16 pixels then Places a orange circle of radius 41 at center (350, 202) then Sets a single purple pixel at (469, 115).
; PLAN: r0=77(x), r1=5(y), r2=40(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=202(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=115(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 5
LDI r2, 40
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 202
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 115
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
