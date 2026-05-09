; DESCRIPTION: Composite: Creates a white rectangular region at (251, 119) spanning 13 by 27 pixels then Places a magenta circle of radius 61 at center (187, 107) then Places a purple dot at position (80, 98).
; PLAN: r0=251(x), r1=119(y), r2=13(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=107(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=98(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 119
LDI r2, 13
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 107
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 98
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
