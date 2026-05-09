; DESCRIPTION: Composite: Places a red dot at position (121, 141) then Creates a white circular shape at (280, 112) with radius 76 then Creates a orange rectangular region at (33, 179) spanning 84 by 22 pixels.
; PLAN: r0=121(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=112(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=33(x), r11=179(y), r12=84(width), r13=22(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 141
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 112
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 33
LDI r11, 179
LDI r12, 84
LDI r13, 22
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
