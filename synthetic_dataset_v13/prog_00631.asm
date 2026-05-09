; DESCRIPTION: Composite: Creates a blue circular shape at (313, 82) with radius 25 then Creates a white rectangular region at (6, 39) spanning 42 by 49 pixels.
; PLAN: r0=313(x), r1=82(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=39(y), r7=42(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 82
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 39
LDI r7, 42
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
