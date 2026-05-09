; DESCRIPTION: Composite: Draws a green circle centered at (468, 99) with radius 28 then Creates a red rectangular region at (178, 50) spanning 87 by 57 pixels.
; PLAN: r0=468(x), r1=99(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=50(y), r7=87(width), r8=57(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 99
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 50
LDI r7, 87
LDI r8, 57
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
