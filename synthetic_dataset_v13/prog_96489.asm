; DESCRIPTION: Composite: Creates a cyan circular shape at (189, 148) with radius 62 then Creates a magenta rectangular region at (77, 186) spanning 72 by 42 pixels.
; PLAN: r0=189(x), r1=148(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=186(y), r7=72(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 148
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 186
LDI r7, 72
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
