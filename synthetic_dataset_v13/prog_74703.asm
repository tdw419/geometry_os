; DESCRIPTION: Composite: Places a white dot at position (156, 23) then Renders a blue disk with center (480, 118) and radius 18 then Creates a cyan rectangular region at (22, 83) spanning 50 by 82 pixels.
; PLAN: r0=156(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=480(x), r6=118(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=83(y), r12=50(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 118
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 83
LDI r12, 50
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
