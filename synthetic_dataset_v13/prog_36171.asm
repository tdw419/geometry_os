; DESCRIPTION: Composite: Places a magenta dot at position (37, 171) then Creates a white rectangular region at (334, 64) spanning 23 by 79 pixels then Renders a cyan disk with center (375, 86) and radius 40.
; PLAN: r0=37(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=64(y), r7=23(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=86(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 64
LDI r7, 23
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 86
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
