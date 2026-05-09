; DESCRIPTION: Composite: Creates a magenta circular shape at (44, 196) with radius 44 then Places a cyan dot at position (201, 143) then Creates a white rectangular region at (313, 127) spanning 18 by 37 pixels.
; PLAN: r0=44(x), r1=196(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=313(x), r11=127(y), r12=18(width), r13=37(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 196
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 313
LDI r11, 127
LDI r12, 18
LDI r13, 37
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
