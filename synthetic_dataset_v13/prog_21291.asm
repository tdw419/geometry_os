; DESCRIPTION: Composite: Creates a green rectangular region at (4, 44) spanning 33 by 75 pixels then Renders a white disk with center (415, 80) and radius 73 then Sets a single purple pixel at (365, 122).
; PLAN: r0=4(x), r1=44(y), r2=33(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=80(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=122(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 4
LDI r1, 44
LDI r2, 33
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 80
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 122
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
