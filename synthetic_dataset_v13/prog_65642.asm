; DESCRIPTION: Composite: Creates a magenta circular shape at (77, 88) with radius 57 then Creates a blue rectangular region at (48, 126) spanning 51 by 13 pixels.
; PLAN: r0=77(x), r1=88(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=126(y), r7=51(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 88
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 126
LDI r7, 51
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
