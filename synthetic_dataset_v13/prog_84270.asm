; DESCRIPTION: Composite: Creates a white rectangular region at (36, 34) spanning 36 by 74 pixels then Creates a cyan circular shape at (152, 93) with radius 59.
; PLAN: r0=36(x), r1=34(y), r2=36(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=93(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 34
LDI r2, 36
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 93
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
