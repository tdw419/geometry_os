; DESCRIPTION: Composite: Creates a cyan circular shape at (162, 89) with radius 49 then Places a red dot at position (33, 63) then Creates a cyan rectangular region at (291, 94) spanning 81 by 33 pixels.
; PLAN: r0=162(x), r1=89(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=63(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=291(x), r11=94(y), r12=81(width), r13=33(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 89
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 63
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 291
LDI r11, 94
LDI r12, 81
LDI r13, 33
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
