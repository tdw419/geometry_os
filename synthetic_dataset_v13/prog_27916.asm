; DESCRIPTION: Composite: Creates a purple rectangular region at (286, 35) spanning 47 by 21 pixels then Places a white circle of radius 30 at center (95, 56) then Places a blue dot at position (213, 51).
; PLAN: r0=286(x), r1=35(y), r2=47(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=56(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=51(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 35
LDI r2, 47
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 56
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 51
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
