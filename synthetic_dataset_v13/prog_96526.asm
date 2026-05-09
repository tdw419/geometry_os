; DESCRIPTION: Composite: Places a cyan dot at position (388, 136) then Places a green circle of radius 25 at center (28, 100) then Creates a white rectangular region at (39, 148) spanning 53 by 91 pixels.
; PLAN: r0=388(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=100(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x), r11=148(y), r12=53(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 100
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 148
LDI r12, 53
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
