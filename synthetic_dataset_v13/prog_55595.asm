; DESCRIPTION: Composite: Sets a single white pixel at (502, 183) then Creates a white circular shape at (365, 105) with radius 67 then Creates a green rectangular region at (42, 20) spanning 29 by 116 pixels.
; PLAN: r0=502(x), r1=183(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=105(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=20(y), r12=29(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 183
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 365
LDI r6, 105
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 20
LDI r12, 29
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
